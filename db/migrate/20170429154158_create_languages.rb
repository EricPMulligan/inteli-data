class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :language, null: false, index: { unique: true }
    end

    create_join_table :datasets, :languages, table_name: :datasets_languages do |t|
      t.string :dataset_id, null: false, index: true
      t.references :language, null: false, index: true, foreign_key: true
    end

    add_foreign_key :datasets_languages, :datasets, column: :dataset_id, primary_key: :oid
  end
end
