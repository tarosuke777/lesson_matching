class TeachersController < ApplicationController
  def index
    @teacher_search_form = TeacherSearchForm.new(search_params)
    @teachers = @teacher_search_form.search
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def proxy_login
    sign_in(:teacher, Teacher.find(params[:id]))
    redirect_to teachers_index_url
  end

  private

  def search_params
    params.fetch(:teacher_search_form, {}).permit(:email).merge(page: params[:page])
  end
end
