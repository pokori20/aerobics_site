Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'homes#top'
  get 'home/about',  to:'homes#about'
  get 'home/infomation',  to:'homes#info'
  # ログイン機能
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # ユーザー機能
  get    '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users, only: :show
  get '/admin',  to: 'admins#top'
  # イベント機能
  resources :events, except: [:new]
end
