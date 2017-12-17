Rails.application.routes.draw do
  get 'contacts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#search'
end
