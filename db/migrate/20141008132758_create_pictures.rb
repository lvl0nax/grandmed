class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
