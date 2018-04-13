class Eventosbahai < ApplicationRecord
	has_many :participants, :dependent => :delete_all
	belongs_to :user
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", big: "600x600>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
