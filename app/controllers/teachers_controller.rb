class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def search
    @teacher_search_form = TeacherSearchForm.new(search_params)
    @teachers = @teacher_search_form.search
    render :index
  end


  def show

  end

  private

  def search_params
    params.fetch(:teacher_search_form).permit(:email)
  end

end
