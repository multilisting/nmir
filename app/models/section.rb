class Section < ActiveRecord::Base
  belongs_to :location

  enum category: AdvEnums::CATEGORIES 
  enum offer_type: AdvEnums::OFFER_TYPES
  enum property_type: AdvEnums::PROPERTY_TYPES

  #delegate :title, :translit, to: :location, prefix: true

  #before_save :generate_title
  #before_save :generate_url

  scope :not_empty, -> { where('advertisments_count > 0') }

  private

  def generate_title

    if(offer_type && category)
      
      self.title = "#{Section.enum_title(offer_type)} #{Section.enum_title(category)} в #{location.title}"
    
    elsif(offer_type && property_type)

      self.title = "#{Section.enum_title(offer_type)} #{property_type} недвижимость в "

    end
    
  end

  def generate_url
    self.url = "#{location.translit}/#{Section.enum_url(offer_type)}/#{Section.enum_url(category)}"
  end

  # returns translated enum value 
  def self.enum_title(type)
    I18n.t("activerecord.attributes.section.enum_title.#{type}")
  end
  
  # returns translated & translited enum value
  def self.enum_url(type)
    Russian::translit Section.enum_title(type)
  end
end
