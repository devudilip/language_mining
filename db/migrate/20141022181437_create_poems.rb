class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.integer :book_id
      t.integer :author_id
      t.string :name
      t.text :poem_text
      t.timestamps
    end
  end
end
