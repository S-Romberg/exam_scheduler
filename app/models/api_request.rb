# frozen_string_literal: true

class ApiRequest < ApplicationRecord
  belongs_to :user, optional: true
end
