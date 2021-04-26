# frozen_string_literal: true

class ExamUser < ApplicationRecord
  belongs_to :exam
  belongs_to :user
end
