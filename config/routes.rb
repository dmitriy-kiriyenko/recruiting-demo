Rails.application.routes.draw do
  devise_for :users

  root to: 'home#show'
  resources :folders do
    resources :images do
      delete :bulk_delete, on: :collection
    end
    resources :rights
  end
end
