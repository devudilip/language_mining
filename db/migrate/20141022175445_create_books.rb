class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :author_id
      t.integer :language_id
      t.string :name 
      t.string :book_name
      t.string :book_volume
      t.string :publisher
      t.string :published_year

      t.timestamps
    end
  end
end

