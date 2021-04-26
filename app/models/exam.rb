# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_windows

  has_many :exam_users
  has_many :users, through: :exam_users
end
