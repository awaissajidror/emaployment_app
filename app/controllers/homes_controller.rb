class HomesController < ApplicationController

  MESSAGES = {
    created: 'Personal Data has been created successfully.',
    emp_created: 'Employment has been created successfully.',
    not_created: 'Personal Data has not been created successfully.',
    emp_not_created: 'Employment has not been created successfully.',
  }.freeze

  def index
  end

  def create_personal_data
    personal_data = PersonalData.new(personal_data_params)
    return flash[:error] = MESSAGES[:not_created] unless personal_data.save

    flash[:success] = MESSAGES[:created]
    redirect_root
  end

  def create_employment
    employment = Employment.new(employment_params)
    return flash[:error] = MESSAGES[:emp_not_created] unless employment.save

    flash[:success] = MESSAGES[:emp_created]
    redirect_root
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(:nick_name, :phone_number,
                                          :email_address, :last_name,
                                          :first_name)
  end

  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_employment_ended)
  end

  def redirect_root
    redirect_to root_url
  end
end
