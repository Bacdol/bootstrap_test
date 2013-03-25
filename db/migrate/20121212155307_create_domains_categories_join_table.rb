class CreateDomainsCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :domains_categories, :id => false do |t|
      t.references :category, :null => false
      t.references :domain, :null => false
    end

    add_index :domains_categories, [:category_id, :domain_id], :unique => true
  end
end
