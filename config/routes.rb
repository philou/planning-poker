Rails.application.routes.draw do

  root 'static_pages#home'

  resources :team_members, only: [:create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
