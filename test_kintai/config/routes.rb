Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'home/index'
  get 'home/show'
  devise_for :users
  root to: "home#index"
  if Rails.env.development? #開発環境の場合
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
