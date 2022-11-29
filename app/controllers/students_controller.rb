class StudentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index 
        render json: student.all
    end 
    def show 
        student = student_params 
        render json: student
    end 
    def create 
        student = student.create(student_new_params) 
        render json: student
    end 
    def update 
        student = student_params 
        students = student.update(student_new_params) 
        render json: students
    end
    def destroy 
        student = student_params 
        student_params.destroy 
        head :no_content
    end

    private 
    def student_params 
        Student.find(params[:id])
    end
    def student_new_params
        params.permit(:name, :age, :majot, :instructor_id) 
    end

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
      end

      def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end
end
