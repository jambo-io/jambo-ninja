class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	validates :name, :email, :city, :presence => true
	
	validates_uniqueness_of :email, if:'email.present?', :message => 'Esse email já foi utilizado, parece que você já está inscrito.'	
	
	
	#validates :name, presence: {message: "Mensagem"}
end
