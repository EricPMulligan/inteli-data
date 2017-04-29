class Language < ApplicationRecord
  has_and_belongs_to_many :data_entries
end
