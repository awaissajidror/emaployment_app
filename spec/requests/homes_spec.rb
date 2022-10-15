require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe 'POST /create' do
    let(:personal_data_attributes) do
      {
        last_name: Faker::Name.last_name,
        nick_name: Faker::Name.first_name,
        first_name: Faker::Name.first_name,
        email_address: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164
      }
    end

    let(:employment_attributes) do
      {
        employer: Faker::Name.name,
        date_started: Faker::Date.backward(days: 14),
        date_employment_ended: Faker::Date.forward(days: 23)
      }
    end

    context 'Create Personal Data' do
      it 'creates a new PersonalData' do
        expect do
          post('/create/personal/data', params: { personal_data: personal_data_attributes })
        end.to(change(PersonalData, :count).by(1))
      end
    end

    context 'Create Employment' do
      it 'creates a new Employment' do
        expect do
          post('/create/employment', params: { employment: employment_attributes })
        end.to(change(Employment, :count).by(1))
      end
    end
  end

end
