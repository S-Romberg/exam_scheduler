# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiRequest, type: :model do
  before(:each) do
    FactoryBot.create(:api_request)
  end

  it 'exists with valid attributes' do
    api_request = ApiRequest.last
    expect(api_request.action_type).to eq('error')
    expect(api_request.description).to eq('Exam window does not exist')
  end
end
