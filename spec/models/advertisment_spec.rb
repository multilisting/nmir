require 'rails_helper'
include AdvSpecHelper

RSpec.describe Advertisment, :type => :model do

  subject(:adv) { AdvSpecHelper.new_adv }

  describe 'has many attributes and' do

    AdvSpecHelper.adv_attr_list.each do |attr|
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

  describe 'has range (_from _to) attributes and' do
    # Validate, that _from attr is less than _to attr
    # price_from < price_to
    AdvSpecHelper.from_methods.each do |from_method|
      
      # compute _to method. price_from becomes price_to
      let(:to_method) { from_method.match(/(\w+)_from/)[1] + '_to' }

      it "with #{from_method} greater than it's _to attribute" do
        adv[from_method] = 1000

        expect(adv).not_to be_valid
      end

      it "when _to attribute set to nil" do
        adv[to_method] = nil

        # if price_to is nil, then we should skip this validation
        expect(adv).to be_valid
      end

      # should respond to attr without '_from' - price_for - price 
      it do 
        method_without_from = from_method.match(/(\w+)_from/)[1].to_sym
        expect(adv).to respond_to(method_without_from)
      end

      # and should return price_from value
      it do 
        method_without_from = from_method.match(/(\w+)_from/)[1].to_sym
        expect(adv.send(method_without_from)).to eq(adv.send(from_method.to_sym))
      end
    end
  end

end


