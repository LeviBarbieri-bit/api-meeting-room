Rails.application.routes.draw do
  #users
  post "/login", to: "users#login"
  post "/register", to: "users#create"
  scope '/users' do
    get "/list", to: "users#index"
    delete "/destroy", to: "users#destroy"
    put "/update", to: "users#update"
  end  
  
  #schedules
  scope '/schedules' do
    post "/create", to: "schedules#create"
    get "/list", to: "schedules#index"
  end
end