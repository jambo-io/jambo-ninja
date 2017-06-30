class Bemvindo < ApplicationRecord
	validates_presence_of :Name, :email => " - Deve ser preenchido"
end
