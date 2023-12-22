# app/controllers/api/v1/students_controller.rb
class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_token!, only: [:show]

  def index
    @students = Student.all
    students = @students.map do |student|
      {
        id: student.id,
        name: student.name,
        unique_number: student.unique_number
      }
    end
    render json: students, status: :ok
  end

  # GET /api/v1/students/1
  def show
    student = Student.find(params[:id])
    render json: {
      id: student.id,
      name: student.name,
      unique_number: student.unique_number
    }
  end

  def new
    # Instead of Students, use Student.new
    Student.new
  end

  def create
    # Instead of Students, use Student.new
    student = Student.new(student_params)
    if student.save
      render json: student, status: :created
    else
      render json: { message: 'ERROR: Unable to create student', errors: student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/students/1
  def destroy
    student = Student.find(params[:id])
    if student.destroy
      render json: { status: 'success', message: 'Student deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the Student' }, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :name,
      :unique_number
    )
  end
end
