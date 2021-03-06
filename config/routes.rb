Fora::Application.routes.draw do
  root to: 'static_pages#root'

  resources :users
  resource :session

  namespace :api, defaults: {format: :json} do
    resources :questions do
      resources :tags, only: [:create]
    end
    resources :answers
    resources :tags
    resources :votes
    resources :follows
  end
end
