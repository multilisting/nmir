class AdminArea < ActiveRecord::Base
  belongs_to :city

  has_many :streets, as: :location, dependent: :destroy
  has_many :landmarks, as: :location, dependent: :desroy
end
