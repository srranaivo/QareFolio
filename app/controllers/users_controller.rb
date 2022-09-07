class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:arrival_address] == ''
      p 'change params'
      params[:user][:arrival_address] = params[:user][:address]
      p params[:user][:arrival_address]
    end
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:address, :arrival_address)
  end
end
