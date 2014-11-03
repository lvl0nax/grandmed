class AdFieldsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :post_id, :integer
    add_column :pictures, :likes, :integer
    add_column :pictures, :shares, :integer
    add_column :pictures, :username, :string
  end
end
