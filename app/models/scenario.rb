class Scenario < ApplicationRecord
  # belongs_to :dilemma
  has_many :dilemma_scenarios
  has_many :dilemmas, through: :dilemma_scenarios

  # added from creation results controler
  has_many :results

end
