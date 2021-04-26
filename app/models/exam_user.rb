class ExamUser < ApplicationRecord
  belongs_to :exam_windows
  belongs_to :users
end
