Rails.application.routes.draw do
  root to: 'static_pages#root'
  namespace :api do
    resources :questions, :only => [:create, :index, :show]
  end
  resources :users, :questions
  resource :session

end
