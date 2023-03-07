class Dilemma < ApplicationRecord
  belongs_to :game
  belongs_to :scenario1, class_name: "Scenario"
  belongs_to :scenario2, class_name: "Scenario"
end
