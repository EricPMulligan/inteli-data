class CreateContactPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_points do |t|
      t.string :dataset_id, null: false, index: true
      t.string :type
      t.string :fn, null: false
      t.string :has_email, null: false
    end

    add_foreign_key :contact_points, :datasets, column: :dataset_id, primary_key: :oid
  end
end
