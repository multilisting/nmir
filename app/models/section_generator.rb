module SectionGenerator
  def by_offer_category(offer_type, category, location)
    Section.find_or_create_by(
      offer_type: Section.offer_types[offer_type], 
      category: Section.categories[category], 
      location_id: location.id
    )
  end

  def by_property_offer(property_type, offer_type, location)
    Section.find_or_create_by(
      property_type: Section.property_types[property_type], 
      offer_type: Section.offer_types[offer_type], 
      location_id: location.id
    )
  end

  def by_location(location)
    Section.find_or_create_by(location_id: location.id, offer_type: nil, property_type: nil, category: nil )
  end
end
