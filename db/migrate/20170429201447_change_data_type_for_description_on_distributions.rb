class ChangeDataTypeForDescriptionOnDistributions < ActiveRecord::Migration[5.0]
  def change
    remove_column :distributions, :description, :string
    add_column :distributions, :description, :text
  end
end
