Rails.application.routes.draw do
    root 'top#main'
    resources :users
    get 'top/main'
    post 'top/login'
    get 'top/login'
    get 'top/logout'
end
