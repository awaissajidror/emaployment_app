class HomesController < ApplicationController

  MESSAGES = {
    emp_created: 'Employment has been created successfully.',
    emp_not_created: 'Employment has not been created successfully.',
  }.freeze

  def index
  end

  def create_employment
    employment = Employment.new(employment_params)
    return flash[:error] = MESSAGES[:emp_not_created] unless employment.save

    flash[:success] = MESSAGES[:emp_created]
    redirect_root
  end

  private

  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_employment_ended)
  end

  def redirect_root
    redirect_to root_url
  end
end
