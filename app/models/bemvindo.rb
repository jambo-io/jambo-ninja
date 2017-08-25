class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	validates :name, :email, :city, :presence => true
	
	validates_uniqueness_of :email, :allow_blank => true, :allow_nil => true, :message => 'Esse email já foi utilizado, parece que você já está inscrito.'	
	
	
	#validates :name, presence: {message: "Mensagem"}
end
