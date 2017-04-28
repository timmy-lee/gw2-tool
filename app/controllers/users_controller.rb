class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      redirect_to sign_in_path, flash: { notice: 'You have successfully registered!'}
    else
      flash[:error] = 'Please check the following fields'
      render :new
    end
  end
end
