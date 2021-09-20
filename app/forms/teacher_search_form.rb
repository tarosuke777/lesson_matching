class TeacherSearchForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :email, :string
    attribute :page, :integer

    def search
        p page
        Teacher.page(page).per(10).where("email like ?", "#{email}%")
    end

end