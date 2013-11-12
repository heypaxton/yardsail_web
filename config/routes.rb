YardailWeb::Application.routes.draw do
  resources :sales, via: [:get, :post]  
end
