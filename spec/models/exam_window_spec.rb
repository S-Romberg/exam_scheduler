require 'rails_helper'

RSpec.describe ExamWindow, type: :model do
  before(:each) do
   FactoryBot.create(:college)
   FactoryBot.create(:exam)
   FactoryBot.create(:exam_window)
  end

  it "exists with valid attributes" do
    window = ExamWindow.last
    expect(window.exam_id).to eq(Exam.last.id)
    expect(window.start_time).to eq(DateTime.current.beginning_of_hour())
    expect(window.end_time.to_i).to eq(DateTime.current.end_of_hour().to_i)
  end
end
