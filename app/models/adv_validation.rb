module AdvValidation

  extend ActiveSupport::Concern

  PRESENCE_FIELDS = lambda {
    YAML::load(File.open("#{Rails.root}/lib/other/presense_fields.yml")).map(&:to_sym)
  }.call

  included do

    validates_presence_of AdvValidation::PRESENCE_FIELDS

  end
  
end
