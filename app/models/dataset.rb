class Dataset < ApplicationRecord
  self.primary_key = :oid

  has_and_belongs_to_many :bureau_codes
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :program_codes
  has_and_belongs_to_many :publishers
  has_and_belongs_to_many :themes

  has_one :contact_point
  has_many :distributions
end
