Rails.application.routes.draw do
  #users
  post "/login", to: "users#login"
  post "/register", to: "users#create"
  get "/auto_login", to: "users#auto_login"
  scope '/users' do
    get "/list", to: "users#index"
    delete "/destroy/:id", to: "users#destroy"
    put "/update/:id", to: "users#update"
  end  
  
  #schedules
  scope '/schedules' do
    post "/create", to: "schedules#create"
    get "/list", to: "schedules#index"
    put "/update", to: "schedules#update"
    delete "/destroy/:id", to: "schedules#destroy"
  end
end