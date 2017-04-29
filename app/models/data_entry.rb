class DataEntry < ApplicationRecord
  self.primary_key = :oid

  belongs_to :publisher
  belongs_to :contact_point

  has_and_belongs_to_many :bureau_codes, join_table: 'data_entries_bureau_codes'
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :program_codes
  has_and_belongs_to_many :themes

  has_many :distributions
end
