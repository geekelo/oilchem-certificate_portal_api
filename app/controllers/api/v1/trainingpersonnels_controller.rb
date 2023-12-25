class Api::V1::TrainingpersonnelsController < ApplicationController
  before_action :authenticate_token!, only: [:show]

  def index
    @api_trainingpersonnels = Trainingpersonnel.all

    trainingpersonnels = @api_trainingpersonnels.map do |trainingpersonnel|
      {
        id: trainingpersonnel.id,
        name: trainingpersonnel.name,
        signature: trainingpersonnel.signature
      }
    end

    render json: trainingpersonnels, status: :ok
  end

  # GET /api/v1/trainingpersonnels/1
  def show
    trainingpersonnel = Trainingpersonnel.find(params[:id])

    render json: {
      id: trainingpersonnel.id,
      name: trainingpersonnel.name,
      signature: trainingpersonnel.signature
    }
  end

  def new
    # Instead of Trainingpersonnels, use Trainingpersonnel.new
    Trainingpersonnel.new
  end

  def create
    # Instead of Trainingpersonnels, use Trainingpersonnel.new
    trainingpersonnel = Trainingpersonnel.new(trainingpersonnel_params)

    if trainingpersonnel.save
      render json: trainingpersonnel, status: :created
    else
      render json: { message: 'ERROR: Unable to create training personnel', errors: trainingpersonnel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/trainingpersonnels/1
  def update
    trainingpersonnel = Trainingpersonnel.find(params[:id])
    if trainingpersonnel.update(trainingpersonnel_params)
      render json: trainingpersonnel, status: :ok
    else
      render json: { message: 'ERROR: Unable to update training personnel', errors: trainingpersonnel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/trainingpersonnels/1
  def destroy
    trainingpersonnel = Trainingpersonnel.find(params[:id])
    if trainingpersonnel.destroy
      render json: { status: 'success', message: 'Item deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the Item' }, status: :unprocessable_entity
    end
  end

  private

  def trainingpersonnel_params
    params.require(:trainingpersonnel).permit(
      :name,
      :signature
    )
  end
end
