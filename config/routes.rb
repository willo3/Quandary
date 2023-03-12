Rails.application.routes.draw do
  get 'results/show'
  get 'dilemmas/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :games do
    resources :dilemmas do
      resources :results, only: :index
        resources :scenarios do
          resources :results, only: :new
        end
      end
    resources :players, only: :create
  end

  # route results
end
