class ChangeIdsTypeInConcord < ActiveRecord::Migration
  def change
    change_column :concords, :ids, :text, :limit => 4294967295
  end
end
