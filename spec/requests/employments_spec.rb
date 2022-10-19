require 'rails_helper'

RSpec.describe "Employments", type: :request do
  describe 'GET /new' do
    it 'renders a successful response' do
      get '/employments/new'
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    let(:employment_attributes) do
      [{
         employer: Faker::Name.name,
         date_started: Faker::Date.backward(days: 14),
         date_employment_ended: Faker::Date.forward(days: 23)
       }]
    end

    context 'Create Employment' do
      it 'creates a new Employment' do
        post('/employments', params: { employments: employment_attributes })
        expect(response).to have_http_status(:success)
      end
    end
  end

end
