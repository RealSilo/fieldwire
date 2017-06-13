class CreateFloorplans < ActiveRecord::Migration[5.1]
  def change
    create_table :floorplans do |t|
      t.references :project, foreign_key: true, index: true, null: false
      t.string :display_name
      t.text :image_data
    end
  end
end
