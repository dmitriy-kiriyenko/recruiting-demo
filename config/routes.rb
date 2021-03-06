Rails.application.routes.draw do
  resources :surveys
  resources :recipient_replies
  resources :assignments, only: [:index, :edit, :update] do
    post :start
  end

  mount ActionCable.server => '/cable'

  devise_for :users

  root to: 'home#show'
  resource :dashboard
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
