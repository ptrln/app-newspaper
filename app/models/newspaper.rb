class Newspaper < ActiveRecord::Base
  attr_accessible :editor_id, :title, :subscription_plans_attributes

  belongs_to :editor, class_name: "User"

  has_many :subscription_plans, inverse_of: :newspaper
    accepts_nested_attributes_for :subscription_plans, :reject_if => :all_blank 
  has_many :subscriptions, :through => :subscription_plans
  has_many :subscribers, :through => :subscriptions, :source => :user

  validates :editor, :title, presence: true
end
