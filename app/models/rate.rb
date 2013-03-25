class Rate < ActiveRecord::Base
  attr_accessible :description, :domain_id, :mark, :status_id, :title, :user_id, :comment_ids, :like_ids

  belongs_to :domain, :inverse_of => :rates
  belongs_to :status, :inverse_of => :rates
  belongs_to :user, :inverse_of => :rates

  has_many :comments
  has_many :likes
end