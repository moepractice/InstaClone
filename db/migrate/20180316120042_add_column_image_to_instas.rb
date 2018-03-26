class AddColumnImageToinstas < ActiveRecord::Migration[5.1]
  def change
    add_column :instas, :image, :string
  end
end
