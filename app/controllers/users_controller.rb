class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def authenticate_user!
    unless current_user
      render 'yourjs'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else  
      redirect :new
    end
  end

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                                 :bio, :email, :phone, :gender, :avatar)
  end
end
