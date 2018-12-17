class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(user_params)

    if user.save
      params[:user][:user_id] = user.id
      profile = Profile.new(profile_params)
      if profile.save(profile_params)
           @current_user = user
      else
         render json: user.errors.full_messages , status: :unprocessable_entity
      end
    else
    #  render json: { errors: { 'Error while creating the account' => ['Try agian']}}, status: :unprocessable_entity
      render json: user.errors.full_messages , status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:provider)
  end

  def profile_params
    params.require(:user).permit(:name,:user_id)
  end

end
