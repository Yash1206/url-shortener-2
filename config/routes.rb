Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :urls, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index, :create, :update, :destroy]
    end
  end
  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
