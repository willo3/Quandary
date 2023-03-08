class Scenario < ApplicationRecord
  # belongs_to :dilemma
  has_many :dilemmas_as_scenario1, class_name: "Dilemma", foreign_key: :scenario1_id
  has_many :dilemmas_as_scenario2, class_name: "Dilemma", foreign_key: :scenario2_id
end
