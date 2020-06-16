Rails.application.routes.draw do
  resources :services, only: %i[] do
    get :check, on: :collection
  end

  root to: "services#check"
end
