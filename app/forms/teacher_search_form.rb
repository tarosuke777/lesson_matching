class TeacherSearchForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :email, :string

    def search
        Teacher.where("email like ?", "#{email}%")
    end

end