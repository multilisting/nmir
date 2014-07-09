class Location < ActiveRecord::Base
  has_many :sublocations, class_name: 'Location', foreign_key: "location_id"

  belongs_to :parent_location, class_name: 'Location', foreign_key: "location_id"

  before_save :transliterate_title

  # remember! add values to the end of array
  enum location_type: [:region, :district, :city, :admin_area, :non_admin_area, :street, :address, :landmark]

  private

  def transliterate_title
    self.translit = Russian::translit(self.title)
  end
end
