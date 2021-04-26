require 'rails_helper'


RSpec.describe "/users/schedule_test", type: :request do
  describe "POST " do
    context "with valid parameters" do
      it "Schedules user for test if user exists" do
        post '/users/schedule_test',
          params: {
            first_name: 'Spencer',
            last_name: 'Romberg',
            phone_number: '7205551324',
            college_id: FactoryBot.create(:college).id,
            exam_id: FactoryBot.create(:exam).id,
            start_time: FactoryBot.create(:exam_window).start_time,
          }, as: :json
      end
    end
  end
end

RSpec.describe "/users", type: :request do

  let(:valid_attributes) {
    {
      first_name: 'Spencer',
      last_name: 'Romberg',
      phone_number: '7205551324',
    }
  }

  let(:invalid_attributes) {
    {
      first_name: nil,
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      get users_url,  as: :json
      expect(response).to be_successful
    end
    it "creates api_request loggin request" do
      get users_url,  as: :json
      api_request_record = ApiRequest.last
      expect(api_request_record.action_type).to eq('Request')
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = FactoryBot.create(:user)
      get user_url(user), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url,
               params: { user: valid_attributes }, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post users_url,
             params: { user: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post users_url,
             params: { user: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          first_name: 'Spencer',
          last_name: 'Romberg',
          phone_number: '5555555555',
        }
      }

      it "updates the requested user" do
        user = FactoryBot.create(:user)
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        user.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the user" do
        user = FactoryBot.create(:user)
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        user = FactoryBot.create(:user)
        patch user_url(user),
              params: { user: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = FactoryBot.create(:user)
      expect {
        delete user_url(user), as: :json
      }.to change(User, :count).by(-1)
    end
  end
end
