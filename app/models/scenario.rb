class Scenario < ApplicationRecord
  # belongs_to :dilemma
  has_many :dilemma_scenarios
  has_many :dilemmas, through: :dilemma_scenarios
end
