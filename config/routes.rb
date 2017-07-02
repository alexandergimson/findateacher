Rails.application.routes.draw do

  devise_for :users

  resources :teachers do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  root 'teachers#index'

  match '/about_us',   to: 'pages#about_us',   via: :get
  match '/contact_us', to: 'pages#contact_us', via: :get

end
