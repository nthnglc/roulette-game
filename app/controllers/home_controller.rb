class HomeController < ApplicationController
    layout 'auth', only: %i[login register forgot_password]

    def index
      #Traer todos los tiros y usuarios
      @roulettes_rolls = RouletteRoll.all
      @users = User.all
      #Informacion de dashboard
      @total_rolls = RouletteRoll.last&.n_roll
      @total_players = User.count
      @earned_by_players = 0
      @roulettes_rolls.each do |roulette_roll|
        @earned_by_players += roulette_roll.amount > 0 ? roulette_roll.amount : 0
      end
             
      @actual_forecast = RouletteRoll.forecast
      RouletteRoll.roll
    end
  end
  