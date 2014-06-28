class Advertisment < ActiveRecord::Base

  CONFORMITY = lambda {
    YAML::load(File.open("#{Rails.root}/lib/other/adv_conformity.yml"))
  }.call

  validates_presence_of :category, :offer_type
  validate :category_conformity
  validate :propery_type_conformity
  
  # enums - add values to the end of array!
  enum offer_type: [:sale, :rent, :for_rent, :day, :buy]

  enum category: [
    :newbuild,
    :flat,
    :house,
    :ijs,
    :room,
    :garage,
    :office,
    :trade,
    :storage,
    :cafe,
    :land,
    :free_appointment
  ]

  enum property_type: [:commerce, :residental]

  private

  def category_conformity
    unless CONFORMITY[self.offer_type].include? category
      errors.add :base, "Неверный тип категории"
    end
  end

  def propery_type_conformity
    unless CONFORMITY[self.property_type].include? offer_type
      errors.add :base, "Неверный тип ???"
    end
  end

end

