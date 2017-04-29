class SwapRelationshipInContactPointsDataEntries < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :contact_points, :data_entries
    remove_index :contact_points, :data_entry_id
    remove_reference :contact_points, :data_entry
    add_reference :data_entries, :contact_point, null: false, index: true, foreign_key: true
  end
end
