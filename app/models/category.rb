class Category < ActiveRecord::Base
  attr_accessible :name, :status_id

  belongs_to :status, :inverse_of => :categories

  #has_and_belongs_to_many :users, :join_table => "users_categories_domains"
  has_and_belongs_to_many :domains, :join_table => "domains_categories"
end
