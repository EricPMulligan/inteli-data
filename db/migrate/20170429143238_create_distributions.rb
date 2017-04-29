class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.string :dataset_id, null: false, index: true
      t.string :type
      t.string :access_url
      t.string :conforms_to
      t.string :download_url
      t.string :described_by
      t.string :described_by_type
      t.string :description
      t.string :format
      t.string :media_type
      t.string :title
    end

    add_foreign_key :distributions, :datasets, column: :dataset_id, primary_key: :oid
  end
end
