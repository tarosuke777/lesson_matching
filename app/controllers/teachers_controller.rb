class TeachersController < ApplicationController
  def index
    @teacher_search_form = TeacherSearchForm.new(search_params)
    @teachers = @teacher_search_form.search
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  # def become
  #   sign_in(:teacher, Teacher.find(params[:id]))
  #   sign_out(:teacher)
  #   redirect_to edit_teacher_registration_url # or user_root_url
  # end

  private

  def search_params
    params.fetch(:teacher_search_form, {}).permit(:email).merge(page: params[:page])
  end
end
