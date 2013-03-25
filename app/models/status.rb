class Status < ActiveRecord::Base
  attr_accessible :name, :domain_ids, :comment_ids, :rate_ids, :category_ids, :user_ids

  has_many :domains, :inverse_of => :status
  has_many :comments, :inverse_of => :status
  has_many :rates, :inverse_of => :status
  has_many :categories, :inverse_of => :status
  has_many :users, :inverse_of => :status
end
