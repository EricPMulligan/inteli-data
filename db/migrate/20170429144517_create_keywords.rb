class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :keyword, null: false
    end

    create_join_table :data_entries, :keywords do |t|
      t.string :data_entry_id, null: false, index: true
      t.references :keyword, null: false, index: true, foreign_key: true
    end

    add_foreign_key :data_entries_keywords, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
