class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true, length: { minimum: 10, maximum: 11 }
end
