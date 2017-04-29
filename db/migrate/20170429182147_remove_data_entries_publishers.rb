class RemoveDataEntriesPublishers < ActiveRecord::Migration[5.0]
  def change
    drop_table :data_entries_publishers
  end
end
