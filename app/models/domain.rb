class Domain < ActiveRecord::Base
	# Validations 
  validates :name, :length => { :minimum => 2 }, :presence => true

  # Attributes
  attr_accessible :name, :status_id, :url, :category_ids, :user_id, :rate_ids

  # Relations
  belongs_to :status, :inverse_of => :domains
  has_many :rates, :inverse_of => :domain
  has_and_belongs_to_many :categories, :join_table => "domains_categories"

  # Functions
  def autocomplete_display_name
    "#{self.name}"
  end
end