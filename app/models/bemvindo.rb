class Bemvindo < ApplicationRecord
	#validates :name, :email, :city, :presence => true
	validates :name, :email, :city, :presence => true
	validates_uniqueness_of :email, :message => 'Esse email já foi utilizado, parece que você já está inscrito.'
	#validates :name, presence: {message: "Mensagem"}
end
