class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.text :name
      t.integer :like_search_count, default: 0
      t.integer :exact_search_count, default: 0
      t.timestamps
    end
  end
end
