class Eventosbahai < ApplicationRecord
	has_many :participants, :dependent => :nullify
	has_many :mailer_reports, class_name:'Admin::MailerReport', :dependent => :nullify
	has_many :questions, :dependent => :destroy
	has_many :answers, :dependent => :destroy
	belongs_to :user
	

	geocoded_by :address # can also be an IP address
	after_validation :geocode, if: :address_changed? # auto-fetch coordinates

	def address
		[location, city, state].compact.join(", ")
	end

	def address_changed?
		location_changed? || city_changed? || state_changed?
	end

	## Avoid Nil Err Data ##
	def price
		super.present? && super > 0 ? super : nil
	end

	def payment
		super.present? ? super : nil
	end

	def description
		super.present? ? super : nil
	end

end
