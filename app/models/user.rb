class User < ActiveRecord::Base
  attr_accessible :about_me, :avatar_url, :birthday, :email, :facebok, :firstname, :lastname, :password, :password_confirmation, :phone_number, :skype, :status_id, :twitter, :user_type, :username, :website, :domain_ids

  acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional

  belongs_to :status, :inverse_of => :users

  has_many :likes, :inverse_of => :user
  has_many :rates, :inverse_of => :user
  has_many :comments, :inverse_of => :user
  has_many :domains, :inverse_of => :user

  #has_and_belongs_to_many :categories, :join_table => "users_categories_domains"
  #has_and_belongs_to_many :domains, :join_table => "users_domains"

  def has_existing_email?
    User.find_by_email(self.email).present?
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end
