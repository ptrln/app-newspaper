class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :is_daily, :newspaper_id, :price

  belongs_to :newspaper, inverse_of: :subscription_plans
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  validates :newspaper, :price, presence: true
  validates :is_daily, :inclusion => {:in => [true, false]}

  #alias_method :is_daily?, :is_daily

  def is_weekly?
    is_daily == false
  end

  def frequency
    return "Daily" if is_daily
    return "Weekly" if is_weekly?
  end
end
