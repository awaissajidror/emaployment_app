class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    personal_data = User.new(user_params)
    personal_data.save
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
