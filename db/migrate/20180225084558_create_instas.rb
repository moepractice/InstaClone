class Createinstas < ActiveRecord::Migration[5.1]
  def change
    create_table :instas do |t|
      t.text :content
      t.integer :user_id
      t.text :image
    end
  end
end
