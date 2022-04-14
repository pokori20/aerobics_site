Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'homes#top'
  get 'home/about', to:'homes#about'
  get 'home/infomation', to:'homes#info'
  # ログイン機能
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
