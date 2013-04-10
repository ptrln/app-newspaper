class UsersController < ApplicationController
  before_filter :require_login, only: [:edit, :update]
  before_filter :only_edit_self, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def only_edit_self
    unless current_user && current_user.id.to_s == params[:id]
      flash[:error] = "you are not authorized for that"
      redirect_to :back
    end
  end
end
