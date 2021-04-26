FactoryBot.define do
  factory :user do
    first_name { 'Spencer' }
    last_name { 'Romberg' }
    phone_number { '7205551324' }
  end

  factory :college do
    name { 'WGU' }
  end

  factory :exam do
    college
  end

  factory :exam_window do
    exam
    start_time { DateTime.current.beginning_of_hour() }
    end_time { DateTime.current.end_of_hour() }
  end

  factory :api_request do
    user
    action { 'error' }
    description { 'Exam window does not exist' }
  end

end
