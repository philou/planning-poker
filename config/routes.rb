Rails.application.routes.draw do

  root 'static_pages#home'

  resources :contributors, only: [:create, :show] do
    resources :estimations, only: :create
  end

  resources :teams, only: [] do
    # TODO try to use a plural :votes as usual
    resource :vote, only: :create
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
