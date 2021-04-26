class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # main method - POST /users/schedule_test
  def schedule_test
    sanitized_phone = user_params[:phone_number].tr('^0-9', '')
    user = User.find_or_create_by(phone_number: sanitized_phone)
    binding.pry

  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end


  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save!
      render json: @user, status: :created, location: @user
    end
  rescue
    render json: @user.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /users/1
  def update
    if @user.update!(user_params)
      render json: @user
    end
  rescue
    render json: @user.errors, status: :unprocessable_entity
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:phone_number, :first_name, :last_name)
    end
end
