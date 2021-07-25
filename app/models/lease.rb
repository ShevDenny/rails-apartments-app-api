class Lease < ApplicationRecord
  belongs_to :apartment, dependent: :destroy
  belongs_to :tenant
end
