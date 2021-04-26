# frozen_string_literal: true

class ApiRequestsController < ApplicationController
  before_action :set_api_request, only: %i[show update destroy]

  # GET /api_requests
  def index
    @api_requests = ApiRequest.all

    render json: @api_requests
  end

  # GET /api_requests/1
  def show
    render json: @api_request
  end

  # POST /api_requests
  def create
    @api_request = ApiRequest.new(api_request_params)

    if @api_request.save
      render json: @api_request, status: :created, location: @api_request
    else
      render json: @api_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api_requests/1
  def update
    if @api_request.update(api_request_params)
      render json: @api_request
    else
      render json: @api_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_requests/1
  def destroy
    @api_request.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_request
    @api_request = ApiRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_request_params
    params.fetch(:api_request, {})
  end
end
