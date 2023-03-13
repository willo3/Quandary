class AddScoreToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :score, :integer
  end
end
