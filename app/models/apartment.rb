class Apartment < ApplicationRecord
    has_many :leases, destroy: :destroy
    has_many :apartments, through: :leases

    validates number:, presence: true
end
