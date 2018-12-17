Rails.application.routes.draw do
  #devise_for :users

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                       path_names: { sign_in: :login, create: :create}

    resources :users, only: [:show, :update] do
      collection do
        post 'facebook'
        get  'user_info'
      end
    end
    resources :profiles, only: [:update] do
      member do
        get 'download_image', as: :download
      end
    end
  end
end
