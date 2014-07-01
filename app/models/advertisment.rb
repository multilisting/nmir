class Advertisment < ActiveRecord::Base

  # validators
  include AdvValidation
  validate :category_conformity
  validate :propery_type_conformity

    
  # Enums
  include AdvEnums
  

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

