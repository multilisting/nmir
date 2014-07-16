class Advertisment < ActiveRecord::Base

  belongs_to :region,   class_name: 'Location', foreign_key: 'region_id'
  belongs_to :district, class_name: 'Location', foreign_key: 'district_id'
  belongs_to :city,     class_name: 'Location', foreign_key: 'city_id'
  belongs_to :admin_area,   class_name: 'Location', foreign_key: 'admin_area_id'
  belongs_to :non_admin_area, class_name: 'Location', foreign_key: 'non_admin_area_id'
  belongs_to :street, class_name: 'Location', foreign_key: 'street_id'
  belongs_to :address, class_name: 'Location', foreign_key: 'address_id'
  belongs_to :landmark, class_name: 'Location', foreign_key: 'landmark_id'

  # validators
  include AdvValidation
  validate :category_conformity
  validate :propery_type_conformity

  # Enums
  include AdvEnums

  after_create :generate_sections
  
  def allowed_attributes
    AdvConformity::ATTR_VISIBILITY[adv_type][category] rescue []
  end

  # define methods like :price, from pirce_from attr
  attribute_names.grep(/_from/).each do |from_method|
    method_name = from_method.match(/(\w+)_from/)[1].to_sym

    define_method(method_name) { return self[from_method] }
  end

  def locations(without_nils = true)
    HashWithIndifferentAccess.new({
      region: region_id, district: district_id, city: city_id, admin_area: admin_area_id,
      non_admin_area: non_admin_area_id, street: street_id, address: address_id, landmark: landmark_id
    }).delete_if {|k, v| v.nil? }
  end

  private

  def generate_sections
    locs = self.locations
    
    locs.each do |loc_title, loc_id|
      # find or create by offer_type + category + each location node, setted in this advertisment
      Section.find_or_create_by(offer_type: offer_type, category: category, location_id: loc_id )

      # find or create by offer_type + category + each location node, setted in this advertisment
      Section.find_or_create_by(property_type: property_type, offer_type: offer_type, location_id: loc_id )

      # find or create by location node
      Section.find_or_create_by(location_id: loc_id, offer_type: nil, property_type: nil, category: nil )

      loc = self.send(:loc_title)
      
      # if location is not parent (region)
      if !loc.nil? && !loc.parent?
        loc_parents = Location.parent_locations(loc)

        # do the same for each parent node
        loc_parents.each do |node|
          Section.find_or_create_by(offer_type: offer_type, category: category, location_id: node.id)
          Section.find_or_create_by(property_type: property_type, offer_type: offer_type, location_id: node.id )

          Section.find_or_create_by(location_id: node.id, offer_type: nil, property_type: nil, category: nil )
        end
      end
    end

  end

  def category_conformity
    unless AdvConformity::TYPE_CONFORMITY[self.offer_type].try(:include?, category)
      errors.add :base, "Неверный тип категории"
    end
  end

  def propery_type_conformity
    unless AdvConformity::TYPE_CONFORMITY[self.property_type].try(:include?, offer_type)
      errors.add :base, "Неверный тип ???"
    end
  end

end

