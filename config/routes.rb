Rails.application.routes.draw do

  resources :messages
  namespace :partner do
    resources :user, only: [:show] do
      resource :requests, only:[:create, :destroy]
    end
  end
  
  namespace :user do
    resources :user, only: [:show, :edit, :update] do
      resources :follows, only:[:destroy, :show, :index]
      post '/requests/:id' => 'requests#allow', as: 'allow'
      resources :requests, only:[:index, :show, :destroy]
    end
  end

  resources :partners, only: [:new, :index, :create, :destroy, :edit]

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
      post 'click_message'
    end
  end

  resources :messages do
    collection do
      post 'click_message'
    end
  end

  
  get 'chat_channels', to: 'chat_channels#index'

  post '/callback', to: 'linebot#callback'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
