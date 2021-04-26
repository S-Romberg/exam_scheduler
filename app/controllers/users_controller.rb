class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # main method - POST /users/schedule_test
  def schedule_test
    @user = grab_user
    @user.save!
    @exam = valid_exam_schedule_request?
    create_exam_user_join

    render json: "Exam scheduled for #{user_params[:start_time]}", status: :ok
  rescue StandardError => e
    render json: e.message, status: 400
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

    render json: @user, status: :created, location: @user if @user.save!
  rescue StandardError
    render json: @user.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /users/1
  def update
    render json: @user if @user.update!(user_params)
  rescue StandardError
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
    params.permit(:user, :college_id, :phone_number, :first_name, :last_name, :start_time, :exam_id)
  end

  def grab_user
    User.find_or_create_by!(phone_number: user_params[:phone_number], first_name: user_params[:first_name],
                           last_name: user_params[:last_name])
  end

  def valid_exam_schedule_request?
    college = College.find(user_params[:college_id])
    exam = Exam.find(user_params[:exam_id])

    exam_belongs_to_college?(college, exam)
    start_time_is_in_exam_windows?(exam)
    exam
  end

  def exam_belongs_to_college?(college, exam)
    raise StandardError, 'This college does not have access to this exam' if college.exams.where(id: exam.id).blank?
  end

  def start_time_is_in_exam_windows?(exam)
    matching_times = exam.exam_windows.select do |window|
      user_params[:start_time].between?(window.start_time, window.end_time)
    end
    raise if matching_times.empty?

    matching_times
  rescue StandardError
    raise StandardError, 'Invalid start time'
  end

  def create_exam_user_join
    ExamUser.create!(user_id: @user.id, exam_id: @exam.id, start_time: user_params[:start_time])
  end
end
