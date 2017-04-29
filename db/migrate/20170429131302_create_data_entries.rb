class CreateDataEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :data_entries, id: false, primary_key: :oid do |t|
      t.string :oid, null: false, index: { unique: true }, primary: true
      t.string :type, null: false
      t.string :access_level, null: false
      t.string :rights
      t.string :accrual_periodicity
      t.string :description, null: false
      t.string :identifier, null: false
      t.datetime :issued
      t.string :landing_page
      t.datetime :modified, null: false
      t.column :spatial, :geometry, null: false
      t.datetime :temporal_start
      t.datetime :temporal_end
      t.string :title
      t.string :license
      t.string :is_part_of
    end

    add_index :data_entries, :spatial, type: :spatial
  end
end
