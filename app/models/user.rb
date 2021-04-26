# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :sanitize_fields

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true, length: { minimum: 10, maximum: 11 }

  private

  def sanitize_fields
    self.phone_number = phone_number&.tr('^0-9', '')
    self.first_name = first_name&.downcase
    self.last_name = last_name&.downcase
  end
end
