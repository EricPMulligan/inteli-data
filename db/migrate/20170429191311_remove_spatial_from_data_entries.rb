class RemoveSpatialFromDataEntries < ActiveRecord::Migration[5.0]
  def change
    remove_index :data_entries, :spatial
    remove_column :data_entries, :spatial
  end
end
