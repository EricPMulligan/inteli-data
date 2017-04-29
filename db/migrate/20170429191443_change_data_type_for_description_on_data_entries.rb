class ChangeDataTypeForDescriptionOnDataEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :data_entries, :description, :string
    add_column :data_entries, :description, :text
  end
end
