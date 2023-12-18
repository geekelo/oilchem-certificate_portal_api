# app/controllers/api/v1/certificates_controller.rb
class Api::V1::CertificatesController < ApplicationController
  before_action :authenticate_token!, only: [:show]

  def index
    @certificates = Certificate.all
    certificates = @certificates.map do |certificate|
      {
        id: certificate.id,
        name: certificate.name,
        title: certificate.title,
        course: certificate.course,
        purpose: certificate.purpose,
        student_id: certificate.student_id,
        start_date: certificate.start_date,
        end_date: certificate.end_date,
        training_director_id: certificate.training_director_id,
        training_instructor_id: certificate.training_instructor_id,
        external_facilitator_id: certificate.external_facilitator_id
      }
    end
    render json: certificates, status: :ok
  end

  # GET /api/v1/certificates/1
  def show
    certificate = Certificate.find(params[:id])
    render json: {
      id: certificate.id,
      name: certificate.name,
      title: certificate.title,
      course: certificate.course,
      purpose: certificate.purpose,
      student_id: certificate.student_id,
      start_date: certificate.start_date,
      end_date: certificate.end_date,
      training_director: certificate.trainingpersonnel_id,
      training_instructor: certificate.trainingpersonnel_id,
      external_facilitator: certificate.trainingpersonnel_id
    }
  end

  def new
    # Instead of Certificates, use Certificate.new
    Certificate.new
  end

  def create
    # Instead of Certificates, use Certificate.new
    certificate = Certificate.new(certificate_params)
    if certificate.save
      render json: certificate, status: :created
    else
      render json: { message: 'ERROR: Unable to create certificate', errors: certificate.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/certificates/1
  def destroy
    certificate = Certificate.find(params[:id])
    if certificate.destroy
      render json: { status: 'success', message: 'Certificate deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the Certificate' }, status: :unprocessable_entity
    end
  end

  private

  def certificate_params
    params.require(:certificate).permit(
      :name,
      :title,
      :course,
      :purpose,
      :student_id,
      :start_date,
      :end_date,
      :training_director_id,
      :training_instructor_id,
      :external_facilitator_id
    )
  end
end
