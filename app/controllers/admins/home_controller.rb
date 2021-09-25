class Admins::HomeController < ApplicationController
    def index
        @teacher_search_form = TeacherSearchForm.new(search_params)
        @teachers = @teacher_search_form.search
    end

    private

    def search_params
        params.fetch(:teacher_search_form, {}).permit(:email).merge(page: params[:page])
    end

end
