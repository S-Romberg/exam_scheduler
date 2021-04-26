# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/users/schedule_test', type: :request do
  let(:valid_attributes) do
    college = FactoryBot.create(:college)
    window = FactoryBot.create(:exam_window)
    exam = window.exam
    {
      first_name: 'Spencer',
      last_name: 'Romberg',
      phone_number: '7205551324',
      college_id: college.id,
      exam_id: exam.id,
      start_time: window.start_time
    }
  end
  describe 'Schedule with valid params ' do
    context 'with valid parameters' do
      before(:each) do
        FactoryBot.create(:exam_window)
      end
      it 'Schedules user for test if params are valid' do
        post '/users/schedule_test',
             params: valid_attributes, as: :json
        expect(response.status).to be(200)
        expect(response.body).to include('Exam scheduled')
      end
    end
  end

  describe 'Schedule with invalid params ' do
    it 'Throws exception if start time is invalid' do
      post '/users/schedule_test', params: { **valid_attributes, start_time: '' }, as: :json
      expect(response.status).to be(400)
      expect(response.body).to eq('Invalid start time')
    end

    it 'Throws exception if exam does not exist' do
      post '/users/schedule_test', params: { **valid_attributes, exam_id: '' }, as: :json
      expect(response.status).to be(400)
      expect(response.body).to include("Couldn't find Exam")
    end

    it 'Throws exception if exam does not belong' do
      exam = Exam.create!(college_id: College.create.id)
      post '/users/schedule_test', params: { **valid_attributes, exam_id: exam.id }, as: :json
      expect(response.status).to be(400)
      expect(response.body).to be('This college does not have access to this exam')
    end
  end
end

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    {
      first_name: 'Spencer',
      last_name: 'Romberg',
      phone_number: '7205551324'
    }
  end

  let(:invalid_attributes) do
    {
      first_name: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_url, as: :json
      expect(response).to be_successful
    end
    it 'creates api_request loggin request' do
      get users_url, as: :json
      api_request_record = ApiRequest.last
      expect(api_request_record.action_type).to eq('Request')
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = FactoryBot.create(:user)
      get user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post users_url, params: valid_attributes, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post users_url, params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url, params: invalid_attributes, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post users_url, params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
