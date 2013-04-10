class SubscriptionPlansController < ApplicationController
  before_filter :only_paper_editor_can_edit, only: [:new, :create, :edit, :update]

  def new
    @plan = SubscriptionPlan.new
    @newspaper = Newspaper.find(params[:newspaper_id])

  end

  def create
    @plan = SubscriptionPlan.new(params[:subscription_plan])
    @plan.newspaper_id = params[:newspaper_id]
    if @plan.save
      redirect_to @plan.newspaper
    else
      @newspaper = Newspaper.find(params[:newspaper_id])
      render :new
    end
  end

  def edit
    @plan = SubscriptionPlan.find(params[:id])
    @newspaper = Newspaper.find(params[:newspaper_id])
  end

  def update
    @plan = SubscriptionPlan.find(params[:id])
    if @plan.update_attributes(params[:subscription_plan])
      redirect_to @plan.newspaper
    else
      @newspaper = Newspaper.find(params[:newspaper_id])
      render :edit
    end
  end

  def only_paper_editor_can_edit
    newspaper = Newspaper.find(params[:newspaper_id])
    unless current_user && current_user.id == newspaper.editor.id
      flash[:error] = "only the newspaper editor can make changes to the subscription plans"
      redirect_to (:back || root_path)
    end
  end
end
