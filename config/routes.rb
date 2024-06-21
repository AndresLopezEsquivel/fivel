Rails.application.routes.draw do
  # resources :services
  devise_for :users
  root to: "pages#home"
  get "/profile", to: "users#profile"
  # get "/pending_orders", to: "sales#show_pending_orders"
  # get "/pending_sales", to: "sales#show_pending_sales"
  get "myorders", to: "sales#my_orders"
  patch "/sales/:id", to: "sales#update_status"
  # get "/services/:id", to: "services#show"
  # post "services/:service_id/sales", to: "sales#create"
  get "/user_services", to: "services#user_services"
  # get "/services/new", to: "services#new"
  # get "services:id/edit", to: "services#edit"
  resources :services, only: %i[index new create edit update destroy show] do
    resources :sales, only: %i[new create]
  end
  resources :sales, only: %i[edit show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/users/languages/new", to: "users#new_language", as: :new_language
  post "/languages", to: "users#create_language"
  get "edit_language/:language_id", to: "users#edit_language", as: :edit_language
  patch "update_language/:language_id", to: "users#update_language", as: :update_language
  delete "destroy_language/:language_id", to: "users#destroy_language", as: "destroy_language"

  get "/users/skills/new", to: "users#new_skill", as: :new_skill
  post "/skills", to: "users#create_skill"
  get "edit_skill/:skill_id", to: "users#edit_skill", as: :edit_skill
  patch "update_skill/:skill_id", to: "users#update_skill", as: :update_skill
  delete "destroy_skill/:skill_id", to: "users#destroy_skill", as: "destroy_skill"

  get "/users/educations/new", to: "users#new_education", as: :new_education
  post "/educations", to: "users#create_education"
  get "edit_education/:education_id", to: "users#edit_education", as: :edit_education
  patch "update_education/:education_id", to: "users#update_education", as: :update_education
  delete "destroy_education/:education_id", to: "users#destroy_education", as: "destroy_education"

  get "/users/certifications/new", to: "users#new_certification", as: :new_certification
  post "/certifications", to: "users#create_certification"
  get "edit_certification/:certification_id", to: "users#edit_certification", as: :edit_certification
  patch "update_certification/:certification_id", to: "users#update_certification", as: :update_certification
  delete "destroy_certification/:certification_id", to: "users#destroy_certification", as: "destroy_certification"
end
