Rails.application.routes.draw do

  root 'static_pages#home'

  resources :team_members, only: [:create, :show]

  resources :teams, only: [] do
    resource :vote, only: :create

    # TODO nest member in teams routes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
