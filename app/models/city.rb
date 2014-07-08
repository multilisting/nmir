class City < ActiveRecord::Base
  belongs_to :district
  belongs_to :region

  has_many :admin_area, dependent: :destroy
  has_many :non_admin_area, dependent: :destroy
  has_many :streets, as: :location, dependent: :destroy
  has_many :landmarks, as: :location, dependent: :destroy

end
