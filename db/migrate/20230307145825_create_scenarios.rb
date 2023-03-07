class CreateScenarios < ActiveRecord::Migration[7.0]
  def change
    create_table :scenarios do |t|
      t.text :content

      t.timestamps
    end
  end
end
