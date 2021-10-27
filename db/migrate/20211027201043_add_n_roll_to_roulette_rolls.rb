class AddNRollToRouletteRolls < ActiveRecord::Migration[6.1]
  def change
    add_column :roulette_rolls, :n_roll, :integer
  end
end
