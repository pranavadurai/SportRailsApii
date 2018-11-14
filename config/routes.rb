Rails.application.routes.draw do
  #devise_for :users

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                       path_names: { sign_in: :login, create: :create}

    resource :user, only: [:show, :update]
  end

end
