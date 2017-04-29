class ChangeDataTypeForAccessUrlOnDistributions < ActiveRecord::Migration[5.0]
  def change
    remove_column :distributions, :access_url, :string
    add_column :distributions, :access_url, :text

    remove_column :distributions, :download_url, :string
    add_column :distributions, :download_url, :text
  end
end
