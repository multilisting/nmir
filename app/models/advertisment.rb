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

  before_create :set_locations
  after_create :generate_sections
  
  def allowed_attributes
    AdvConformity::ATTR_VISIBILITY[adv_type][category] rescue []
  end

  # define methods like :price, from pirce_from attr
  attribute_names.grep(/_from/).each do |from_method|
    method_name = from_method.match(/(\w+)_from/)[1].to_sym

    define_method(method_name) { return self[from_method] }
  end

  def locations
    HashWithIndifferentAccess.new({
      region: region, district: district, city: city, admin_area: admin_area,
      non_admin_area: non_admin_area, street: street, address: address, landmark: landmark
    }).delete_if {|k, v| v.blank? }
  end

  def locations_array
    [region, district, city, admin_area, non_admin_area, street, address, landmark].delete_if do |l|
      l.blank?
    end
  end

  private

  # set all location nodes from one, that submited
  def set_locations
    self.locations.each do |loc_title, loc|
      break if loc_title == :region

      location_nodes = Location.parent_locations(loc)

      location_nodes.each do |node|
        self[ "#{node.location_type}_id" ] = node.id
      end
    end
  end

  def generate_sections

    self.locations.each do |loc_title, loc|
      # find or create by offer_type + category + each location node, setted in this advertisment
      SectionGenerator.by_offer_category(offer_type, category, loc)

      # find or create by property_type + offer_type + each location node, setted in this advertisment
      SectionGenerator.by_property_offer(property_type, offer_type, loc)

      # find or create by location node
      SectionGenerator.by_location(loc)

    end

    
    STDERR.puts(Section.all.inspect) 

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

