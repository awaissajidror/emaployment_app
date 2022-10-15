class HomesController < ApplicationController

  MESSAGES = {
    created: 'Personal Data has been created successfully.',
    not_created: 'Personal Data has not been created successfully.'
  }.freeze

  def index
  end

  def create_personal_data
    personal_data = PersonalData.new(personal_data_params)
    personal_data.save
  end

  def create_employment
    employment = Employment.new(employment_params)
    employment.save
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(:nick_name, :phone_number, :email_address, :last_name, :first_name)
  end

  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_employment_ended)
  end
end
