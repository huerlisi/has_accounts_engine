# encoding: UTF-8

# Routes
Rails.application.routes.draw do
  # Bookings
  resources :bookings do
    member do
      get :copy
    end
  end

  resources :accounts do
    member do
      get :csv_bookings
      get :edit_bookings
      post :update_bookings
    end
    resources :bookings
    resources :attachments
  end

  resources :booking_templates do
    member do
      get :new_booking
    end
  end
end
