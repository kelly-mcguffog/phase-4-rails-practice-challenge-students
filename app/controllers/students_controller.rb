class StudentsController < ApplicationController
    def index
        render json: Student.all, status: :ok
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student, status: :accepted
    end

    def destroy
        student = Student.find(params[:id])
        if student
            student.destroy
            head :no_content
        else
            render json: {error: 'Student not found'}, status: 404
        end
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
end
