class CreateDilemmaScenarios < ActiveRecord::Migration[7.0]
  def change
    create_table :dilemma_scenarios do |t|
      t.references :dilemma, null: false, foreign_key: true
      t.references :scenario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
