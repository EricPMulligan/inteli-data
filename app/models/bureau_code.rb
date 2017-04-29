class BureauCode < ApplicationRecord
  has_and_belongs_to_many :datasets, join_table: 'bureau_codes_datasets'
end
