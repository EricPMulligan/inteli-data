class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :language, null: false, index: { unique: true }
    end

    create_join_table :data_entries, :languages, table_name: :data_entries_languages do |t|
      t.string :data_entry_id, null: false, index: true
      t.references :language, null: false, index: true, foreign_key: true
    end

    add_foreign_key :data_entries_languages, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
