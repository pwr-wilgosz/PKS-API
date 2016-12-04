class Issue < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :description, presence: true

  belongs_to :bus
end

