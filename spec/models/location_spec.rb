require 'rails_helper'

RSpec.describe Location, :type => :model do
  fixtures :locations
  subject(:location) { locations(:city) }

  specify { expect(location).to respond_to(:title, :translit, :location_type, :parent_location, :sublocations) }

  it 'translit method to return transliterated title' do
    location.save
    expect(location.translit).to eq('rostov')
  end

  describe 'has selfjoined relations' do
    # see fixture
    let(:street) { locations(:street) }
    let(:district) { locations(:district) }

    it 'with sublocations' do
      expect(location.sublocations.first).to eq(street)
    end

    it 'with parent_location' do
      expect(location.parent_location).to eq(district)
    end
  end

  describe 'has neighborhoods.' do
    let(:street) { locations(:street) }
    let(:district) { locations(:district) }

    before { location.neighbors << [ street, district ] } 

    it 'can add new neighbors' do
      expect(location.neighbors.count).to eq(2)
    end

    it 'dont have inverse relation' do
      expect(street.neighbors.count).to eq(0)
    end
  end

end
