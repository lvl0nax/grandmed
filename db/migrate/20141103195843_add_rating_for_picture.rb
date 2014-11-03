class AddRatingForPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :rating, :integer
  end
end
