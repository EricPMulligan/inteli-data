class CreateContactPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_points do |t|
      t.string :data_entry_id, null: false, index: true
      t.string :type
      t.string :fn, null: false
      t.string :has_email, null: false
    end

    add_foreign_key :contact_points, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
