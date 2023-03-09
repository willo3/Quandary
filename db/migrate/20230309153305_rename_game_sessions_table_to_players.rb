class RenameGameSessionsTableToPlayers < ActiveRecord::Migration[7.0]
  def change
    rename_table :game_sessions, :players
  end
end
