# Users controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if params[:search]
      search_users
    else
      @users = User.order(params[:sort])
    end
  end

  # Method searchs for given user
  # if no user is found, user is noticed
  def search_users
    if @user = User.all.find { |user|
      user.username.include?(params[:search])
    }
      redirect_to user_path(@user)
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User not found' }
        format.json { head :no_content }
      end
    end
  end

  # GET /users/1 or /users/1.json
  def show
    # empty
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   @user = current_user
  #   if @user.authenticate(params[:user][:current_password])
  #     respond_to do |format|
  #       if @user.update(user_params)
  #         format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @user }
  #       else
  #         format.html { render :edit, status: :unprocessable_entity }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   else
  #     flash.now[:error] = 'Incorrect password'
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:id, :username, :first_name, :last_name, :email, :password, :pic_url, :birth_date, :state_id, :bio, :role_id)
  end
end
