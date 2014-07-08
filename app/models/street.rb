class Street < ActiveRecord::Base
  belongs_to :location, polymorphic: true

  has_many :addresses, dependent: :destroy
  has_many :landmarks, as: :location, dependent: :destroy
end
