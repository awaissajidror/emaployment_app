class EmploymentsController < ApplicationController

  def new
  end

  def create
    Employment.insert_all(params[:employments])
    render 'close_modal'
  end
end
