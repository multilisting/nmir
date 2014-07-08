class NonAdminArea < ActiveRecord::Base
  belongs_to :city
  belongs_to :admin_area

  has_many :streets, as: :location, dependent: :destroy
  has_many :landmarks, as: :location, dependent: :desroy
end
