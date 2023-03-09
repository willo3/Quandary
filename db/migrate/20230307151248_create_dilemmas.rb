class CreateDilemmas < ActiveRecord::Migration[7.0]
  def change
    create_table :dilemmas do |t|
      t.references :game, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
