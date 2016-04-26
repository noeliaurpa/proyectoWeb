Rails.application.routes.draw do

    # constraints subdomain: 'api' do
    namespace :api, path: '/', defaults: {format: 'json'} do
        namespace :v1 do

            resources :users
            resources :products
            resources :transactions
            resources :sessions, only: [:create, :destroy]


            match '/all',  to: 'products#all',            via: 'get'
            match '/other_Product_id',  to: 'products#other_Product_id',            via: 'get'
            match '/all_transactions',  to: 'transactions#all_transactions',            via: 'get'
            
            match '/signin',  to: 'sessions#create',      via: 'post'
            match '/signup',  to: 'users#create',         via: 'post'
            match '/signout', to: 'sessions#destroy',     via: 'delete'

            # end
        end
    end
end
