class Dilemma < ApplicationRecord
  belongs_to :game
  has_many :dilemma_scenarios
  has_many :scenarios, through: :dilemma_scenarios
end
