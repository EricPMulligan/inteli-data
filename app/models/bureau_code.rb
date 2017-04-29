class BureauCode < ApplicationRecord
  has_and_belongs_to_many :data_entries, join_table: 'data_entries_bureau_codes'
end
