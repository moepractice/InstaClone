class AddColumnUseridToinstas < ActiveRecord::Migration[5.1]
  def change
    add_column :instas, :user_id, :integer
  end
end
