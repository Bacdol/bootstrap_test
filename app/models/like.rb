class Like < ActiveRecord::Base
  attr_accessible :negative, :positive, :rate_id, :user_id

  belongs_to :user, :inverse_of => :likes
  belongs_to :rate, :inverse_of => :likes
end
