Rails.application.routes.draw do
    resources :users
    resources :companies
    resources :salarys
    resources :works
    post '/works/show' => 'works#show'
    get 'top/main'
    post 'top/login'
    get 'top/login'
    get 'top/logout'
    #root 'top#main'
    root 'companies#index'
end
