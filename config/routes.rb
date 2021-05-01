Rails.application.routes.draw do

  scope module: :admin do
   devise_for :admin
  end

  namespace :admin do
   root to: 'homes#top'
   resources :customers, :only => [:index, :show, :edit, :update]
   resources :items, except: :destroy
   resources :genres, :only => [:index, :create, :edit, :update]
  end

  scope module: :public do
   devise_for :customers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
