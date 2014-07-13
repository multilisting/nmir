class Location < ActiveRecord::Base
  has_many :sublocations, class_name: 'Location', foreign_key: "location_id"

  belongs_to :parent_location, class_name: 'Location', foreign_key: "location_id"

  before_save :transliterate_title

  # neighbors
  #has_many :neighborhoods, dependent: :destroy
  #has_many :neighbors, through: :neighborhoods
  has_and_belongs_to_many :neighbors, 
                          class_name: 'Location', 
                          join_table: 'neighborhoods',
                          foreign_key: 'location_id',
                          association_foreign_key: 'neighbor_id'

  # remember! add values to the end of array
  enum location_type: [:region, :district, :city, :admin_area, :non_admin_area, :street, :address, :landmark]


  def locative
    last_chars = self.title[-2, 2]

    case last_chars
    when /[бвгджзклмнпрсфхцчшщ]$/
      self.title + 'е'
    when /а$/
      self.title.gsub(/.$/, 'е')
    when /ое|ий|ый/
      self.title.gsub(/ое|ий|ый/, 'ом')
    when /ая/
      self.title.gsub(/ая/, 'ой')
    when /ь$/
      self.title.gsub(/ь$/, 'и')
    else
      self.title
    end
  end

  private

  def transliterate_title
    self.translit = Russian::translit(self.title).downcase
  end
end
