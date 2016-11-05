class Issue < ApplicationRecord
  belongs_to :bus, dependent: :destroy
end

