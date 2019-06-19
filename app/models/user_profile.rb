class UserProfile < ApplicationRecord
    belongs_to :user, optional: true
    has_one :administrative_region
    
end
