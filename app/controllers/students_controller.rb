class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
  end

  def activate
    @student = set_student
    @student.active = !@student.active
    @student.save
    @student.to_s
    redirect_to action: "show", id: @student.id
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
