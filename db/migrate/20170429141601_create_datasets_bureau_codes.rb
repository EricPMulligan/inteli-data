class CreateDatasetsBureauCodes < ActiveRecord::Migration[5.0]
  def change
    create_join_table(:datasets, :bureau_codes, table_name: :datasets_bureau_codes) do |t|
      t.string :dataset_id, null: false, index: true
      t.references :bureau_code, null: false, index: true, foreign_key: true
    end

    add_foreign_key :datasets_bureau_codes, :datasets, column: :dataset_id, primary_key: :oid
  end
end
