require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /new' do
    it 'renders a successful response' do
      get '/users/new'
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    let(:user_attributes) do
      {
        last_name: Faker::Name.last_name,
        nick_name: Faker::Name.first_name,
        first_name: Faker::Name.first_name,
        email_address: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164
      }
    end

    context 'Create Personal Data' do
      it 'creates a new Personal Data' do
        post('/users', params: { user: user_attributes })
        expect(response).to have_http_status(:success)
      end
    end
  end
end
