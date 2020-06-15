Rails.application.routes.draw do
  resources :services, only: %i[index] do
    get :check, on: :collection
  end

  root to: "services#index"
end
