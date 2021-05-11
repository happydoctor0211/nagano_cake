Rails.application.routes.draw do

  scope module: :admin do
   devise_for :admin
  end

  namespace :admin do
   root to: 'homes#top'
   resources :customers, :only => [:index, :show, :edit, :update]
   resources :items, except: :destroy
   resources :genres, :only => [:index, :create, :edit, :update]
   resources :orders, :only => [:show, :update]
   resources :order_items, :only => [:update]
  end



  scope module: :public do
   root to: 'homes#top'
   get 'about', to: 'homes#about'
   devise_for :customers
   #https://qiita.com/yuki_0920/items/14594e697a8aa44b725cを参照
   #devise_scope :customer do
    #get 'customers/sign_up', to: 'devise/registrations#new'
    #post 'customers', to: 'devise/registrations#create'
    #get 'customers/sign_in', to: 'devise/sessions#new'
    #post 'customers/sign_in', to: 'devise/sessions#create'
    #delete 'customers/sign_out', to: 'devise/sessions#destroy'
   #end
   resources :items, :only => [:index, :show]
   resources :addresses, :only => [:index, :edit, :create, :update, :destroy]
   get 'customers/my_page', to:'customers#show'
   get 'customers/edit', to:'customers#edit'
   resources :orders, :only => [:new, :index, :show, :create]
   post 'orders/confirm', to:'orders#confirm'
   get 'orders/complete', to:'orders#complete'

   delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :cart_items, :only => [:index, :update, :destroy, :create]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
