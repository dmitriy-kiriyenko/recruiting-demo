Rails.application.routes.draw do
  devise_for :users

  root to: 'home#show'
  resource :dashboard

  resources :questionnaires

  resources :folders do
    resources :images do
      resources :comments

      delete :bulk_delete, on: :collection
    end

    resources :rights
  end
  resources :comments do
    resources :comments
  end
  resource :image_search
end
