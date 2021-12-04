Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :promotions do
    resources :comments do
      put 'like', to: 'comments#upvote'
      put 'dislike', to: 'comments#downvote'
      put 'unvote', to: 'comments#unvote'
    end
    member do
      put 'like', to: 'promotions#upvote'
      put 'dislike', to: 'promotions#downvote'
      put 'unvote', to: 'promotions#unvote'
    end
  end
  root to: redirect('/promotions')

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
end
