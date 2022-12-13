Rails.application.routes.draw do
  root "main#index"
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  confirmations: 'users/confirmations',
  passwords: 'users/passwords',
  sessions: 'users/sessions',
  unlocks: 'users/unlocks',
  omniauth_callbacks: "users/omniauth_callbacks"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
