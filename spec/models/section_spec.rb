require 'rails_helper'

RSpec.describe Section, :type => :model do
  fixtures :locations

  subject(:section) { Section.new(
                                  location_id: locations(:city).id, 
                                  offer_type: :buy,
                                  category: :flat
  ) }

  describe 'after save' do
    before { section.save }

    it 'should have generated title' do
      expect(section.title).to eq('куплю квартиру в Ростове')
    end

    it 'should have generated url' do
      expect(section.url).to eq('rostov/kuplyu/kvartiru')
    end
  end



end
