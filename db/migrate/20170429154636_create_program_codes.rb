class CreateProgramCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :program_codes do |t|
      t.string :program_code, null: false, index: { unique: true }
    end

    create_join_table :datasets, :program_codes, table_name: :datasets_program_codes do |t|
      t.string :dataset_id, null: false, index: true
      t.references :program_code, null: false, index: true, foreign_key: true
    end

    add_foreign_key :datasets_program_codes, :datasets, column: :dataset_id, primary_key: :oid
  end
end
