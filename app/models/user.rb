class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :session_token, :subscription_plan_ids

  has_many :subscriptions
  has_many :subscription_plans, :through => :subscriptions
  has_many :subscribed_newspapers, :through => :subscription_plans, :source => :newspapers

  has_many :newspapers, foreign_key: "editor_id"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :session_token, uniqueness: true, allow_nil: true
  validates :name, :password, presence: true

  def editor?
    newspapers.size > 0
  end
end
