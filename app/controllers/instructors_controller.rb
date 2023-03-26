class InstructorsController < ApplicationController
    def index
        render json: Instructor.all, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    def destroy
        instructor = Instructor.find(params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: {error: "Instructor not found"}, status: 404
        end
    end

    private

    def instructor_params
        params.permit(:name)
    end
end
