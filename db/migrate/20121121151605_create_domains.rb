class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :url
      t.references :status
      t.references :user

      t.timestamps
    end
  end
end
