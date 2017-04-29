class Publisher < ApplicationRecord
  belongs_to :parent_organization, class_name: 'Publisher', foreign_key: :parent_id

  has_and_belongs_to_many :datasets

  has_one :sub_organization_of, class_name: 'Publisher', foreign_key: :parent_id
end
