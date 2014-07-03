class Advertisment < ActiveRecord::Base

  # validators
  include AdvValidation
  validate :category_conformity
  validate :propery_type_conformity

    
  # Enums
  include AdvEnums
  
  def allowed_attributes
    AdvConformity::ATTR_VISIBILITY[adv_type][category] rescue []
  end

  # define methods like :price, from pirce_from attr
  attribute_names.grep(/_from/).each do |from_method|
    method_name = from_method.match(/(\w+)_from/)[1].to_sym

    define_method(method_name) { return self[from_method] }
  end

  private

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

