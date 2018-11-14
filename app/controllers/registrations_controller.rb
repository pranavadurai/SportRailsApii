class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(user_params)

    if user.save
      @current_user = user
    else
    #  render json: { errors: { 'Error while creating the account' => ['Try agian']}}, status: :unprocessable_entity
    render json: user.errors.full_messages , status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end
