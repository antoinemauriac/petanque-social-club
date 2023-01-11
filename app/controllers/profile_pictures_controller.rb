class ProfilePicturesController < ApplicationController

  def new
    @avatars = Avatar.all.shuffle
    @profile_picture = ProfilePicture.new
    @user = current_user
  end

  def create
    ProfilePicture.create(
      avatar_id: params[:avatar_id],
      user_id: current_user.id         # or however you retrieve the current user
    )
    # flash[:notice] = 'Avatar mis à jour'
    redirect_to accueil_path
  end

  def edit
    @avatars = Avatar.all.shuffle
  end

  def update
    @profile_picture = current_user.profile_picture
    @profile_picture.update(avatar_id: params[:avatar_id], user_id: current_user.id)
    current_user.avatar = @profile_picture.avatar
    # flash[:notice] = 'Avatar mis à jour !' # just a suggestion
    redirect_to accueil_path
  end

end
