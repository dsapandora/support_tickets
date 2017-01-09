Rails.application.routes.draw do
  get 'closed_tickets/send_report'

  resources :statuses
  resources :responses
  resources :tickets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User', at: 'auth' , controllers: {
                    registrations: 'user/registrations', sessions: 'user/sessions'
                   }
end
