Rails.application.routes.draw do
  devise_for :users
  get 'admins/index'
  get 'teachers/index'
  get 'teachers/show'
  get 'teachers/proxy_login'
  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'teachers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
