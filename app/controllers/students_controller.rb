class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to(students_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Student.all.where("lower(name) LIKE :search OR lower(cohort) LIKE :search", search: @parameter + "%")
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :cohort)
    end
end
