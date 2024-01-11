class Api::V1::BatchesController < ApplicationController
  before_action :authenticate_token!, only: [:show]

  # GET /api/v1/batches
  def index
    @batches = Batch.all

    batches = @batches.map do |batch|
      {
        id: batch.id,
        name: batch.name,
        start_date: batch.start_date,
        end_date: batch.end_date
      }
    end

    render json: batches, status: :ok
  end

  # GET /api/v1/batches/1
  def show
    batch = Batch.find(params[:id])

    render json: {
      id: batch.id,
      name: batch.name,
      start_date: batch.start_date,
      end_date: batch.end_date
    }
  end

  # POST /api/v1/batches
  def create
    batch = Batch.new(batch_params)

    if batch.save
      render json: batch, status: :created
    else
      render json: { message: 'ERROR: Unable to create batch', errors: batch.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/batches/1
  def update
    batch = Batch.find(params[:id])
    if batch.update(batch_params)
      render json: batch, status: :ok
    else
      render json: { message: 'ERROR: Unable to update batch', errors: batch.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/batches/1
  def destroy
    batch = Batch.find(params[:id])
    if batch.destroy
      render json: { status: 'success', message: 'Item deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the Item' }, status: :unprocessable_entity
    end
  end

  private

  def batch_params
    params.require(:batch).permit(
      :name,
      :start_date,
      :end_date
    )
  end
end
