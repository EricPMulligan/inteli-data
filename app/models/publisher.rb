class Publisher < ApplicationRecord
  belongs_to :parent_organization, class_name: 'Publisher', foreign_key: :parent_id

  has_many :data_entries

  has_one :sub_organization_of, class_name: 'Publisher', foreign_key: :parent_id
end
