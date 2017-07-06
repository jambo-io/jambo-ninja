class Bemvindo < ApplicationRecord
	validates_presence_of :name, :email => " - Deve ser preenchido"
end
