class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :keyword, null: false
    end

    create_join_table :datasets, :keywords do |t|
      t.string :dataset_id, null: false, index: true
      t.references :keyword, null: false, index: true, foreign_key: true
    end

    add_foreign_key :datasets_keywords, :datasets, column: :dataset_id, primary_key: :oid
  end
end
