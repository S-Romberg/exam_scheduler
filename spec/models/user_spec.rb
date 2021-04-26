# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    FactoryBot.create(:user) if User.all.empty?
  end

  it 'exists with valid attributes' do
    user = User.last
    expect(user.first_name).to eq('spencer')
    expect(user.last_name).to eq('romberg')
    expect(user.phone_number).to eq('7205551324')
  end
end
