class RouletteRoll < ApplicationRecord

    def self.roll
        players = User.where("balance > 0") #Traer todos los jugadores con saldo positivo
        forecast = self.forecast #Se consulta API para traer temperatura actual
        color = self.spin #Se ejecuta la ruleta para traer el color ganador
        n_roll = RouletteRoll.last&.n_roll.to_i + 1 #Se trae el ultimo numero de jugadas para crear los nuevos tiros
        players.each do |player|
            if player.balance < 1000 #Jugador con menos de 1000 va all-in
                bet = player.balance
            elsif forecast >= 24 #Si la temperatura actual es mayor o igual a 24
                bet = player.balance * rand(8..15) / 100
            else
                bet = player.balance * rand(4..10) / 100
            end
            player.balance -= bet #Se descuenta a cada jugador la apuesta
            player.save
            play_per_user = RouletteRoll.new #Se crea la jugada de el jugador actual
            if player.color == color #Si color de jugador coincide con el ganador
                case color
                    when "Verde"
                        player.balance += 15 * @bet
                    when "Rojo"
                        player.balance += 2 * @bet
                    when "Negro"
                        player.balance += 2 * @bet
                end                
                player.save #Se almacena el nuevo monto del jugador
                play_per_user.amount = @bet #Se almacena lo ganado
            else
                play_per_user.amount = -@bet #Se almacena lo perdido
            end            
            
            #Informacion extra de el tiro
            play_per_user.color = @color
            play_per_user.user_id = player.id
            play_per_user.forecast = forecast            
            play_per_user.n_roll = n_roll
            
            play_per_user.save #Se guarda la jugada
        end
    end

    def self.forecast
        require 'nokogiri'
		require 'open-uri'
		
        #Se consulta API de OpenWeatherMap para consultar el tiempo en el momento actual
		request = Nokogiri::HTML(URI.open('https://api.openweathermap.org/data/2.5/weather?q=Santiago,cl&APPID=cb5bc8264314bcca310c6ea1376bfc42&units=metric'))
		forecast = JSON.parse(request)['main']['temp'].to_f
        return forecast		
    end

    def self.spin
        #Se utiliza rand para generar el valor aleatorio
		case rand(100) + 1 				
			when 1..2 then "Verde"  
			when 3..46 then "Rojo"	
			when 47..90 then "Negro"	
			else "Ninguno"
		end
	end
end
