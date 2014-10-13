class CreateAphorisms < ActiveRecord::Migration
  def change
    create_table :aphorisms do |t|
      t.string :image
      t.integer :likes
      t.integer :shares
      t.string :author

      t.timestamps
    end
  end
end
