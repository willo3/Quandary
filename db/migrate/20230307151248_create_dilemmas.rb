class CreateDilemmas < ActiveRecord::Migration[7.0]
  def change
    create_table :dilemmas do |t|
      t.references :game, null: false, foreign_key: true
      t.references :scenario1, foreign_key: { to_table: :scenarios }
      t.references :scenario2, foreign_key: { to_table: :scenarios }

      t.timestamps
    end
  end
end
