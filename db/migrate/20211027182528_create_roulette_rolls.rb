class CreateRouletteRolls < ActiveRecord::Migration[6.1]
  def change
    create_table :roulette_rolls do |t|
      t.string :color
      t.references :user
      t.integer :forecast
      t.integer :amount

      t.timestamps
    end
  end
end
