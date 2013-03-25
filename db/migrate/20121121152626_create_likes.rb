class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :positive
      t.integer :negative
      t.references :user
      t.references :rate

      t.timestamps
    end
  end
end
