class AdministrativeRegion < ApplicationRecord
    belongs_to :user_profile, optional: true
end
