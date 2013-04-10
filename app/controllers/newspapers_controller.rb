class NewspapersController < ApplicationController
  before_filter :only_editor_can_edit, only: [:edit, :update]

  def index
    @newspapers = Newspaper.all
  end

  def new
    @newspaper = Newspaper.new
    2.times { @newspaper.subscription_plans.build }
    @new_newspaper = true
  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])
    (2 - @newspaper.subscription_plans.size).times { @newspaper.subscription_plans.build }
    if @newspaper.save
      redirect_to @newspaper
    else
      @new_newspaper = true
      render :new
    end
  end

  def edit
    @newspaper = Newspaper.find(params[:id])
  end

  def update
    @newspaper = Newspaper.find(params[:id])
    if @newspaper.update_attributes(params[:newspaper])
      redirect_to @newpaper
    else
      render :edit
    end
  end

  def show
    @newspaper = Newspaper.find(params[:id])
  end

  def only_editor_can_edit
    newspaper = Newspaper.find(params[:id])
    unless current_user && current_user.id == newspaper.editor.id
      flash[:error] = "only the editor can make changes to this newpaper"
      redirect_to (:back || root_path)
    end
  end
end
