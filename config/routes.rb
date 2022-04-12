Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to:'homes#about'
  get 'home/infomation', to:'homes#in'
end
