class Dilemma < ApplicationRecord
  belongs_to :game
  has_many :dilemma_scenarios
  has_many :scenarios, through: :dilemma_scenarios
  has_many :results

  def other_results(user)
    results.filter { |result| result.user != user }
  end
end
