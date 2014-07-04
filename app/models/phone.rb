class Phone < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :original
  validates_uniqueness_of :number

  before_validation :normalize



  private 

  def convert_city_phones(num)
    case num
      # Megaphone
      when /^\+7863226/
        num.gsub /863/, '928'
      else
        self.number
    end
  end

  def normalize
    self.number = original.gsub(/[\(\)\-_ ]+/, '')
    self.number.gsub!(/^8/, '+7')

    if self.number.length == 6
      self.number = "2#{self.number}"
    end

    if self.number.length == 7
      self.number = "+7863#{self.number}"
    end

    self.number = convert_city_phones(self.number)

  end

end
