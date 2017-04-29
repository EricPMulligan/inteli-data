class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name, null: false, index: { unique: true }
    end

    create_join_table :datasets, :themes, table_name: :datasets_themes do |t|
      t.string :dataset_id, null: false, index: true
      t.references :themes, null: false, index: true, foreign_key: true
    end

    add_foreign_key :datasets_themes, :datasets, column: :dataset_id, primary_key: :oid
  end
end
