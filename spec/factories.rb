FactoryBot.define do
  factory :college do
    name { 'WGU' }
  end

  factory :user do
    first_name { 'Spencer' }
    last_name { 'Romberg' }
    phone_number { '7205551324' }
  end

  factory :exam do
    association :college
  end

  factory :exam_window do
    association :exam
    start_time { DateTime.current.beginning_of_hour() }
    end_time { DateTime.current.end_of_hour() }
  end

  factory :api_request do
    association :user
    action_type { 'error' }
    description { 'Exam window does not exist' }
  end

end
