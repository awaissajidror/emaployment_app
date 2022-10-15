Rails.application.routes.draw do
  root 'homes#index'

  post '/create/personal/data', to: 'homes#create_personal_data'
  post '/create/employment', to: 'homes#create_employment'
end
