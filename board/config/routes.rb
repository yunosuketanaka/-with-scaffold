Rails.application.routes.draw do
  resources :my_threads do
    resources :comments
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
