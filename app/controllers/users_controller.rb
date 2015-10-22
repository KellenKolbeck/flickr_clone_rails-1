class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = Photo.all
  end

private

    def sign_up_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
