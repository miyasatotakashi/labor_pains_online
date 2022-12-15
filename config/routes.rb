Rails.application.routes.draw do
  resources :contacts
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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
