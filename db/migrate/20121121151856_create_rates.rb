class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :title
      t.text :description
      t.integer :mark
      t.references :domain
      t.references :status
      t.references :user

      t.timestamps
    end
  end
end
