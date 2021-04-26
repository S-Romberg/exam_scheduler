require 'rails_helper'

RSpec.describe Exam, type: :model do
  before(:each) do
   FactoryBot.create(:college)
   FactoryBot.create(:exam)
  end

  it "exists with valid attributes" do
    exam = Exam.last
    expect(exam.college_id).to eq(College.last.id)
  end
end
