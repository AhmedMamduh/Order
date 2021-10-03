Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }
  namespace :api do
    namespace :v1 do
      resources :main_orders, only: %i[index create update]
    end
  end
end
