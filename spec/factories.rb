FactoryBot.define do
  factory :college do
    name { 'WGU' }
    initialize_with { College.find_or_create_by(name: name)}
  end

  factory :user do
    first_name { 'Spencer' }
    last_name { 'Romberg' }
    phone_number { '7205551324' }
    initialize_with { User.find_or_create_by(phone_number: phone_number)}
  end

  factory :exam do
    association :college
  end

  factory :exam_window do
    association :exam
    start_time { DateTime.current.beginning_of_hour() }
    end_time { DateTime.current.end_of_hour() }
    initialize_with { ExamWindow.find_or_create_by(start_time: start_time)}
  end

  factory :api_request do
    action_type { 'error' }
    description { 'Exam window does not exist' }
    initialize_with { ApiRequest.find_or_create_by(action_type: action_type)}
  end

end
