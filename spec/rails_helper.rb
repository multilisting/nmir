# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end

module AdvSpecHelper
  def adv_attr_list
    %i(
      offer_type
      property_type
      category

      created_at
      updated_at
      expire_date
      payed_adv
      manually_added
      distance
      time_on_transport
      time_on_foot
      sales_agent
      name
      phone
      agent_category    	
      organization
      agency_id
      currency
      period
      space_unit
      not_for_agents

      floor_from
      floor_to
      floor_cnt_from
      floor_cnt_to
      space_from
      space_to
      space_unit
      outdoors_space_from
      outdoors_space_to
      outdoors_space_unit
      rooms
      price_from
      price_to
      unit_price_from
      unit_price_to
      outdoors_unit_price_from
      outdoors_unit_price_to
      mortgage
      keywords

      location_name
      location_id
      country_name
      country_id
      region_name
      region_id
      district_name
      district_id
      locality_name
      locality_id
      sub_locality_name
      sub_locality_id
      non_admin_sub_locality
      address_id
      address_name
      direction_id
      direction_name
      metro_id
      metro_name

    )
  end

  def from_methods
    Advertisment.attribute_names.grep(/_from/)
  end

  def new_adv
    # valid parameters
    Advertisment.new({
      offer_type: 1,
      property_type: 1,
      category: 1,
      currency: 1,

      expire_date: (DateTime.now + 2.days),
      distance: 100,
      time_on_transport: 15,
      time_on_foot: 15,
      sales_agent: 'asd',
      name: 'asd',
      phone: '123',
      agent_category: 1,    	
      organization: 'asd',
      agency_id: 1,
      period: 1,
      space_unit: 'sd',
      not_for_agents: true,

      floor_from: 1,
      floor_to: 4,
      floor_cnt_from: 3,
      floor_cnt_to: 6,
      space_from: 50,
      space_to: 100,
      space_unit: 7,
      outdoors_space_from: 100,
      outdoors_space_to: 500,
      outdoors_space_unit: 10, 
      rooms: 11,
      price_from: 100,
      price_to: 500,
      unit_price_from: 10,
      unit_price_to: 50,
      outdoors_unit_price_from: 16,
      outdoors_unit_price_to: 25,
      mortgage: false,
      keywords: 'asd zxc',

      location_name: 'asd',
      location_id: 1,
      country_name: 'asd',
      country_id: 2,
      region_name: 'zxc',
      region_id: 2,
      district_name: 'zxc',
      district_id: 3,
      locality_name: 'qwe',
      locality_id: 4,
      sub_locality_name: 'asd',
      sub_locality_id: 4,
      non_admin_sub_locality: 'asd',
      address_id: 2,
      address_name: 'zcv',
      direction_id: 2,
      direction_name: 'fdg',
      metro_id: 3,
      metro_name: 'cbvx'
    })
  end
end
