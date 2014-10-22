class CreateDailyPoems < ActiveRecord::Migration
  def change
    create_table :daily_poems do |t|
      t.integer :poem_id
      t.date :published_date
      t.timestamps
    end
  end
end
