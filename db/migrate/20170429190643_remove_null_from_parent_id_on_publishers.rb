class RemoveNullFromParentIdOnPublishers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :publishers, :parent_id, true
  end
end
