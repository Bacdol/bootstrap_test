# encoding: utf-8
class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end

    Status.create(:name => "Validé")
    Status.create(:name => "Brouillon")
    Status.create(:name => "Moderation")
    Status.create(:name => "Supprimé")
  end
end
