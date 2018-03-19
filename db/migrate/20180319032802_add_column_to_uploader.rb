class AddColumnToUploader < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :data
    end
  end
end
