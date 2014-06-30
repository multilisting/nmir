require 'rails_helper'

RSpec.describe Advertisment, :type => :model do

  subject(:adv) { new_adv }

  describe 'has many attributes and' do

    adv_attr_list.each do |attr|
      it { expect(adv).to respond_to(attr) }
    end 
  end

  describe 'with specific offer type' do
    before { adv.offer_type = :day }

    # category validation depending on Conformity table. see lib/other/adv_conformity.yml
    it 'and invalid category' do
      adv.category = :ijs
      expect(adv).not_to be_valid
    end

    it 'and valid category' do
      adv.category = :flat
      expect(adv).to be_valid
    end

    it 'and valid property_type' do
      adv.property_type = :residental
      expect(adv).to be_valid
    end

    it 'and valid property_type' do
      adv.property_type = :commerce
      expect(adv).not_to be_valid
    end
  end

  describe 'has required fields' do
    it 'and with filled fields' do
      expect(adv).to be_valid
    end

    # checks presence of all fields, specified in a file. see lib/other/presense_fields.yml
    AdvValidation::PRESENCE_FIELDS.each do |field|
      it "and without #{field}" do
        adv[field] = nil
        expect(adv).not_to be_valid
      end
    end
  end

end

def new_adv
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
    floor_to: 2,
    floor_cnt_from: 3,
    floor_cnt_to: 4,
    space_from: 5,
    space_to: 6,
    space_unit: 7,
    outdoors_space_from: 8,
    outdoors_space_to: 9,
    outdoors_space_unit: 10, 
    rooms: 11,
    price_from: 12,
    price_to: 13,
    unit_price_from: 14,
    unit_price_to: 15,
    outdoors_unit_price_from: 16,
    outdoors_unit_price_to: 17,
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

