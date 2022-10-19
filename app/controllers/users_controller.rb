class UsersController < ApplicationController

  MESSAGES = {
    created: 'Personal Data has been created successfully.',
    not_created: 'Personal Data has not been created successfully.',
  }.freeze

  def new
    @user = User.new
  end

  def create
    personal_data = User.new(user_params)
    return flash[:error] = MESSAGES[:not_created] unless personal_data.save

    flash[:success] = MESSAGES[:created]
    @employment = Employment.new
    render 'open_second_form'
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :phone_number,
                                 :email_address, :last_name,
                                 :first_name)
  end

end
