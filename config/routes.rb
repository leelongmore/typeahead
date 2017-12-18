Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'contacts/index'
  get '/contacts/:id', to: 'contacts#show', as: 'contact'

  root 'pages#search'
end
