Rails.application.routes.draw do
  get 'top/index'
  devise_scope :user do
    root "top#index"
  end
  devise_for :users,controllers: {
  registrations: 'users/registrations',
  confirmations: 'users/confirmations',
  passwords: 'users/passwords',
  sessions: 'users/sessions',
  unlocks: 'users/unlocks',
  omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :mains, only: [:index]

  resources :mains do
    collection do
      post 'push_text'
    end
  end

  post '/callback', to: 'linebot#callback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
