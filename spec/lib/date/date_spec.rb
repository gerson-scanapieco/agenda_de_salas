require 'rails_helper'


describe Date do
  describe '.get_current_week_commercial_days(current_date)' do
    
    before(:each) do
      Timecop.freeze(Date.new(2015,5,10))
    end

    it 'returns a range containing the first day of the commercial week of the given date' do
      expect(Date.get_current_week_commercial_days(Date.today).first).to eq Date.new(2015,5,4)
    end

    it 'returns a range containing the fifth day of the commercial week of the given date' do
      expect(Date.get_current_week_commercial_days(Date.today).last).to eq Date.new(2015,5,8)
    end
  end

end
