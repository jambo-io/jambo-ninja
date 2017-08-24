class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	validates :name, :email, :city, :presence => true
	#validates :name, presence: {message: "Mensagem"}
end
