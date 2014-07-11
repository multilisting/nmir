module AdvEnums

  extend ActiveSupport::Concern

  CATEGORIES = [
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

  ADV_TYPES = [:demand, :offer]

  OFFER_TYPES = [:sale, :rent, :for_rent, :day, :buy]


  included do

    # enums - add values to the end of array!
    enum offer_type: AdvEnums::OFFER_TYPES

    enum category: AdvEnums::CATEGORIES

    enum property_type: [:commerce, :residental]

    enum adv_type: AdvEnums::ADV_TYPES

    enum currency: [:RUR, :RUB, :EUR, :USD, :UAH, :BYR, :KZT]

  end
end
