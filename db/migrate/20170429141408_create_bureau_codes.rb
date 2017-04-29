class CreateBureauCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :bureau_codes do |t|
      t.string :code, null: false
    end
  end
end
