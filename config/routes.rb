Rails.application.routes.draw do
  get 'admins/index'
  get 'teachers/index'
  get 'teachers/show'
  get 'teachers/become'
  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  root 'teachers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
