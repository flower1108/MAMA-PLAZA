class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :child_information, :introduction, :profile_image)
  end
end
