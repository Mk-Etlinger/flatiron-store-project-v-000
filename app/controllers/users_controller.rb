class UsersController < ApplicationController
  
  def create
    User.create(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:user).require(:email, :password, :password_confirmation )
  end  

end
