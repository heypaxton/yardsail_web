YardailWeb::Application.routes.draw do
  devise_for :users
  resources :sales, via: [:get, :post]  

  root to: "sales#index"
end
