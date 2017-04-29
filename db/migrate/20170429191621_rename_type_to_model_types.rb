class RenameTypeToModelTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :contact_points, :type, :string
    add_column :contact_points, :contact_point_type, :string

    remove_column :data_entries, :type, :string
    add_column :data_entries, :data_entry_type, :string

    remove_column :distributions, :type, :string
    add_column :distributions, :distribution_type, :string

    remove_column :publishers, :type, :string
    add_column :publishers, :publisher_type, :string
  end
end
