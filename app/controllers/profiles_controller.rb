class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)

    if user_params[:run_level].empty? && user_params[:surf_level].empty?
      flash.alert = "Vous devez définir votre niveau"
      redirect_to edit_profile_path
    elsif !true?(user_params[:runner]) && !true?(user_params[:surfer])
      flash.alert = "Vous devez choisir aux moins un sport"
      redirect_to edit_profile_path
    elsif user_params[:runner] && user_params[:run_level].empty?
      flash.alert = "Vous devez définir votre niveau"
      redirect_to edit_profile_path
    elsif user_params[:surfer] && user_params[:surf_level].empty?
      flash.alert = "Vous devez définir votre niveau"
      redirect_to edit_profile_path
    elsif @user.update(user_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  private

  def true?(obj)
    obj.to_s.downcase == "true"
  end

  def user_params
    params.require(:user).permit(:runner, :run_level, :password, :surfer, :surf_level)
  end
end
