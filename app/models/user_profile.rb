class UserProfile < ApplicationRecord
    belongs_to :user, optional: true
end
