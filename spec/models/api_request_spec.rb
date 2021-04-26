require 'rails_helper'

RSpec.describe ApiRequest, type: :model do
  before(:each) do
   FactoryBot.create(:user)
   FactoryBot.create(:api_request)
  end

  it "exists with valid attributes" do
    api_request = ApiRequest.last
    expect(api_request.action_type).to eq('error')
  end
end
