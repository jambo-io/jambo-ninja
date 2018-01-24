module BemvindosHelper

	private 
	def registered_users
	    bemvindos = Bemvindo.where(:city => city, created_at: DateTime.now.beginning_of_month).order(:name)


		return bemvindos
	end

	def available_sits
		
		count = Bemvindo.where(:city => city).group('bemvindos.id').count.length

		
	    remaining = 35 - count
	    word1 = "vaga".pluralize(@remaining)
	    word2 = "restante".pluralize(@remaining)
	    return "#{remaining} #{word1} #{word2}"
	end

	private
	def city
		city = ['riobrilhante-ms','dourados-ms','campogrande-ms'];
	end
end
