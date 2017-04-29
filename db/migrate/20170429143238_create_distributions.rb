class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.string :data_entry_id, null: false, index: true
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

    add_foreign_key :distributions, :data_entries, column: :data_entry_id, primary_key: :oid
  end
end
