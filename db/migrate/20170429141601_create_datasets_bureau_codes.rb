class CreateDatasetsBureauCodes < ActiveRecord::Migration[5.0]
  def change
    create_join_table(:data_entries, :bureau_codes, table_name: :data_entries_bureau_codes) do |t|
      t.string :data_entry_id, null: false, index: true
      t.references :bureau_code, null: false, index: true, foreign_key: true
    end

    add_foreign_key :data_entries_bureau_codes, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
