class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if @user = User.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to edit_user_path(current_user)
    else
      flash[:notice] = "プロフィールを更新できませんでした"
      render "homes/index"
    end
  end

private

  def user_params
    params.require(:user).permit(:profile_img_id, :username, :profile, :email)
  end
end