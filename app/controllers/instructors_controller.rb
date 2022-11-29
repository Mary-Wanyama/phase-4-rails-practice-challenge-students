class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        render json: Instructor.all
    end 
    def show 
        instructor = instructor_params 
        render json: instructor
    end 
    def create 
        instructor = Instructor.create(instructor_new_params) 
        render json: instructor
    end 
    def update 
        instructor = instructor_params 
        instructors = instructor.update(instructor_new_params) 
        render json: instructors
    end
    def destroy 
        instructor = instructor_params 
        instructor_params.destroy 
        head :no_content
    end

    private 
    def instructor_params 
        Instructor.find(params[:id])
    end
    def instructor_new_params
        params.permit(:name) 
    end

    def render_not_found_response
        render json: { error: "Instructor not found" }, status: :not_found
      end

      def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end
end
