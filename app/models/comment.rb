class Comment < ActiveRecord::Base
  attr_accessible :description, :rate_id, :status_id, :user_id

  belongs_to :user, :inverse_of => :comments
  belongs_to :rate, :inverse_of => :comments
  belongs_to :status, :inverse_of => :comments
end
