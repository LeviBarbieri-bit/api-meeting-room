Rails.application.routes.draw do
  #users
  post "/login", to: "users#login"
  scope '/users' do
    get "/list", to: "users#index"
    post "/register", to: "users#create"
    delete "/destroy", to: "users#destroy"
  end  
  
  #schedules
  scope '/schedules' do
    post "/create", to: "schedules#create"
    get "/list", to: "schedules#index"
  end
end