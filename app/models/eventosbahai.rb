class Eventosbahai < ApplicationRecord
	has_many :participants, :dependent => :nullify
	belongs_to :user
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", big: "600x600>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	geocoded_by :address # can also be an IP address
	after_validation :geocode, if: :address_changed? # auto-fetch coordinates

	def address
		[location, city, state].compact.join(", ")
	end

	def address_changed?
		location_changed? || city_changed? || state_changed?
	end

end
