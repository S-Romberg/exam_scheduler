require 'rails_helper'

RSpec.describe ApiRequest, type: :model do
  before(:each) do
   FactoryBot.create(:user)
   FactoryBot.create(:api_request)
  end

  it "exists with valid attributes" do
    api_request = ApiRequest.last
    expect(user.first_name).to eq('Spencer')
    expect(user.last_name).to eq('Romberg')
    expect(user.phone_number).to eq('7205551324')
  end
end
