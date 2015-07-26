class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :key_words do |t|
      t.string :word
      t.integer :count
      t.text :poem_ids
      t.text :author_ids
      t.timestamps
    end
    add_index :key_words, :word
  end
end
