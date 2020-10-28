class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @phrases = @user.phrases
  end

  def index
    @users = User.paginate(:page => params[:page])
  end


end
