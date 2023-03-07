class Result < ApplicationRecord
  belongs_to :user
  belongs_to :dilemma
  belongs_to :scenario
end
