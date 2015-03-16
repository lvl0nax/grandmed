class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.text :home
      t.text :rules
      t.text :rating
      t.text :step1
      t.text :step2
      t.text :step3
      t.text :authorize

      t.timestamps
    end
  end
end
