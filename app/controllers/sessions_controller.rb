# Sessions controller
class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      # if @user.unconfirmed?
      #   redirect_to new_confirmation_path, alert: 'Incorrect email or password.' 
      if @user.password == params[:user][:password].strip
        login @user
        redirect_to root_path, notice: 'Signed in.'
      else
        flash.now[:alert] = 'Incorrect email or password.'
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'Incorrect email or password.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Signed out.'
  end

  def new
    # empty
  end
end
