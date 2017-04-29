class AddPublisherIdToDataEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :data_entries, :publisher, null: false, index: true, foreign_key: true
  end
end
