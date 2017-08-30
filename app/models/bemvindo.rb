class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	

	validates_presence_of :name, :allow_blank => false
	validates_presence_of :email, :allow_blank => false
	validates_presence_of :city, :allow_blank => false, :allow_nil => false
	
	validates_uniqueness_of :email, if:'email.present?', :message => 'Olhamos os papéis aqui, e parece que você já está inscrito.'	

	#validates :name, presence: {message: "Mensagem"}
end
