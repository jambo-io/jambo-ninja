class Eventosbahai < ApplicationRecord
	has_many :participants, :dependent => :nullify
	belongs_to :user

	geocoded_by :address # can also be an IP address
	after_validation :geocode, if: :address_changed? # auto-fetch coordinates

	def address
		[location, city, state].compact.join(", ")
	end

	def address_changed?
		location_changed? || city_changed? || state_changed?
	end

end
