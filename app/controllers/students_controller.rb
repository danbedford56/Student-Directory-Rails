class StudentsController < ApplicationController

  def new

  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params.require(:student).permit(:name, :cohort))

    if @student.save
      redirect_to @student
    else
      render 'new'
    end

  end
end
