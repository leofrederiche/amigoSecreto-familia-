Rails.application.routes.draw do
  
  get "/", to: "welcome#index", as: :root
  post "/", to: "welcome#create", as: false
  get "/delete/:id", to: "welcome#delete", as: :delete
  
  get "/user/:id", to: "user#show", as: :show


end
