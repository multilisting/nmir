module AdvEnums

  extend ActiveSupport::Concern

  included do

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

    enum adv_type: [:demand, :offer]

    enum currency: [:RUR, :RUB, :EUR, :USD, :UAH, :BYR, :KZT]

  end
end
