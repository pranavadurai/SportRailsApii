class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      @current_user = User.find(@profile.user_id)
    else
      render json: user.errors.full_messages , status: :unprocessable_entity
    end
  end

  def download_image
    @profile_image = Profile.find(params[:id])
    send_file(@profile_image.avatar.url(:medium), type: @profile_image.avatar_content_type, disposition: 'inline')
  end

  private
  def profile_params
    params.require(:profile).permit(:name,:location,:phone,:phone,:work,:college,:avatar)
  end

end
