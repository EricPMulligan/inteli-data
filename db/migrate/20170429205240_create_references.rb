class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :data_entry_id, null: false, index: true
      t.string :reference, null: false
    end

    add_foreign_key :references, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
