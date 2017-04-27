Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    patch :vote_up
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
