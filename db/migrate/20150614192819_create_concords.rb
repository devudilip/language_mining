class CreateConcords < ActiveRecord::Migration
  def change
    create_table :concords do |t|
      t.string :name, null: false
      t.integer :parent_id
      t.string :concord_code, null: false
      t.integer :count
      t.text :ids
      t.timestamps
    end
  end
end
