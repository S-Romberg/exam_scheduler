require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    if User.all.empty?
      FactoryBot.create(:user)
    end
  end

  it "exists with valid attributes" do
    user = User.last
    expect(user.first_name).to eq('Spencer')
    expect(user.last_name).to eq('Romberg')
    expect(user.phone_number).to eq('7205551324')
  end
end
