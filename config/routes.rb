Rails.application.routes.draw do
  get 'restaurants/stadistics', to: 'restaurants#stadistic'
  resources :restaurants 
end
