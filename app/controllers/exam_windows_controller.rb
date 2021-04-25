class ExamWindowsController < ApplicationController
  before_action :set_exam_window, only: [:show, :update, :destroy]

  # GET /exam_windows
  def index
    @exam_windows = ExamWindow.all

    render json: @exam_windows
  end

  # GET /exam_windows/1
  def show
    render json: @exam_window
  end

  # POST /exam_windows
  def create
    @exam_window = ExamWindow.new(exam_window_params)

    if @exam_window.save
      render json: @exam_window, status: :created, location: @exam_window
    else
      render json: @exam_window.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exam_windows/1
  def update
    if @exam_window.update(exam_window_params)
      render json: @exam_window
    else
      render json: @exam_window.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exam_windows/1
  def destroy
    @exam_window.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_window
      @exam_window = ExamWindow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_window_params
      params.fetch(:exam_window, {})
    end
end
