
GAMIFICATION = true

module Gamification


	# SETTER o level do usuario
	def level_up(user)

		user_points = user.points

		case user_points

		# lvl1 - ovo
		when 0...30
			nivel = 1

		# lvl2 - pintinho
		when 30...42
			nivel = 2

		# lvl3 - Martelo de madeira
		when 42...59
			nivel = 3

		# lvl4 - Martelo duplo de madeira
		when 59...82
			nivel = 4
			
		# lvl5 - Martelo de pedra
		when 82...115
			nivel = 5
			
		# lvl6 - Martelo duplo de pedra
		when 115...161
			nivel = 6

		# lvl7 - Martelo de ferro
		when 161...226
			nivel = 7
		
		# lvl8 - Martelo duplo de ferro
		when 226...316
			nivel = 8

    else
      nivel = nil
    end

		# get level que o user se encaixa
		to_level = Level.find_by(nivel: nivel)

		# define o level atualizado para o user
		user.level = to_level

		# salva o user
		user.save

	end

end