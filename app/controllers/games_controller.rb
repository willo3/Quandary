class GamesController < ApplicationController
  def index
  end

  def show
  end

  def create
    room_code = [('A'..'Z')].map(&:to_a).flatten
    room_code_string = (0...4).map { room_code[rand(room_code.length)] }.join
    @game = Game.create(room_code: room_code_string, user: current_user)
    redirect_to game_path(@game)
    # else
    #   redirect_to root_path
    # end
  end
end
