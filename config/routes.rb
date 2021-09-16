Rails.application.routes.draw do
  root "webinars#index"

  # get "/PATH", to: "CONTROLLER#ACTION"
  # get "/webinars", to: "webinars#index"
  # get "/webinars/:id", to: "webinars#show"
  resources :webinars
  get "webinars/signup/:id", to: "webinars#signup", as: "signup"
  post "webinars/signup/:id", to: "webinars#signup_confirm", as: "signup_confirm"

  post "checkouts/create", to: "checkouts#create"
end
