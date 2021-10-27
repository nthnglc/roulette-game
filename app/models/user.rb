class User < ApplicationRecord
    def self.bonus
        all.each do |player|
            player.balance += 10000
            player.save
        end
	end 
end
