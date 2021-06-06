Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "login_user"

  delete "logout", to: "sessions#destroy", as: "logout"

  get "register", to: "users#new", as: "register"
  post "register", to: "users#create", as: "create_user"

  get "messages", to: "chats#new", as: "new_chats"
  post "messages", to: "chats#create", as: "message"

  mount ActionCable.server, at: '/cable'
end
