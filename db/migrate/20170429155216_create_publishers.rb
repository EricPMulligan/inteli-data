class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.integer :parent_id, null: false, index: true
      t.string :type
      t.string :name, null: false
    end

    create_join_table :data_entries, :publishers, table_name: :data_entries_publishers do |t|
      t.string :data_entry_id, null: false, index: true
      t.references :publisher, null: false, index: true, foreign_key: true
    end

    add_foreign_key :data_entries_publishers, :data_entries, column: :data_entry_id, primary_key: :oid
    add_foreign_key :publishers, :publishers, column: :parent_id
  end
end
