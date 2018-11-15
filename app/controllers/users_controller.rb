class UsersController < ApplicationController

  before_action :authenticate_user

  def show
    @current_user = current_user
  end

  def facebook
    user = User.find_by_email(params[:user][:email])

    if user && user.provider == params[:user][:provider]
      @current_user=user
    else
      user = User.new(user_params_fb)
      if user.save
        @current_user = user
      else
        render json: user.errors.full_messages , status: :unprocessable_entity
      end
    end
  end

  private
  def user_params_fb
    params.require(:user).permit(:name,:email,:password,:provider)
  end

end
