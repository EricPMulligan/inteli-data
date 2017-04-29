class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name, null: false, index: { unique: true }
    end

    create_join_table :data_entries, :themes, table_name: :data_entries_themes do |t|
      t.string :data_entry_id, null: false, index: true
      t.references :theme, null: false, index: true, foreign_key: true
    end

    add_foreign_key :data_entries_themes, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
