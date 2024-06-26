# Confirmations controller
class ConfirmationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.present?
      redirect_to root_path, notice: 'Check your email for confirmation instructions.'
    else
      redirect_to new_confirmation_path, alert: 'We could not find a user with that email.'
    end
  end

  def edit
    @user = User.find_by(email: params[:user][:email].downcase)
    #   @user = User.find_signed(params[:confirmation_token], purpose: :confirm_email)

    #   if @user.present?
    #  @user.confirm!
    #  redirect_to root_path, notice: 'Your account has been confirmed.'
    #   else
    #  redirect_to new_confirmation_path, alert: 'Invalid token.'
    #   end
    if @user.present?
      @user.confirm!
      login @user
    end
  end

  def new
    @user = User.new
  end
end
