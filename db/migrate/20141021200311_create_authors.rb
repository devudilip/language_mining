class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :pen_name
      t.string :birth_place
      t.string :name
      t.boolean :sex
      t.string :spouse
      t.string :time_period
      t.integer :poems_found
      t.text :information
      t.integer :original_id
      t.timestamps
    end
    add_index :authors, :name
  end
end

