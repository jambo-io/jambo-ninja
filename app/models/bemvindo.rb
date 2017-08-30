class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	validates :name, :email, :city, :allow_blank => false, :allow_nil => false, :presence => true
	
	validates_uniqueness_of :email, if:'email.present?', :message => 'Olhamos os papéis aqui, e parece que você já está inscrito.'	
	
	#validates :name, presence: {message: "Mensagem"}
end
