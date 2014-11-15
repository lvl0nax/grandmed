class AddIndexToPictures < ActiveRecord::Migration
  def change
    add_index :pictures, :rating
  end
end
