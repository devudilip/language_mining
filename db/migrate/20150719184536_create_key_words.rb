class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :key_words do |t|
      t.string :word
      t.integer :count
      t.text :poem_ids, :limit => 4294967295
      t.text :author_ids, :limit => 4294967295
      t.timestamps
    end
    add_index :key_words, :word
  end
end
