class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email,    :null => false
      t.string :username, :null => false, :default => ''
      t.string :crypted_password,    :null => false
      t.string :password_salt,       :null => false
      t.string :persistence_token,   :null => false
      t.string :single_access_token, :null => false
      t.string :perishable_token,    :null => false
      t.string :website
      t.string :twitter
      t.string :facebok
      t.string :skype
      t.date :birthday
      t.string :phone_number
      t.text :about_me
      t.string :user_type
      t.string :avatar_url
      t.references :status
      
      #Magick column Authlogic Gem
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      
      t.timestamps                                          
    end
  end
end
