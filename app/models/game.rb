class Game < ApplicationRecord
  belongs_to :user
  has_many :game_sessions, dependent: :destroy
  has_many :dilemmas, dependent: :destroy
end
