class HomeController < ApplicationController
    layout 'auth', only: %i[login register forgot_password]

    def index
      #Traer todos los tiros y usuarios
      @roulettes_rolls = RouletteRoll.all
      @users = User.all
      #Informacion de dashboard
      @total_rolls = RouletteRoll.count
      @total_players = User.count
      @earned_by_players = 0
      @roulettes_rolls.each do |roulette_roll|
        @earned_by_players += roulette_roll.amount
      end
             
      @actual_forecast = '0º'
    end
  
    private
  end
  