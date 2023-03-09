class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    room_code = [('A'..'Z')].map(&:to_a).flatten
    room_code_string = (0...4).map { room_code[rand(room_code.length)] }.join
    @game = Game.create(room_code: room_code_string, user: current_user)
    redirect_to game_path(@game)
# raise
    # else
    #   redirect_to root_path
    # end
  end

  # private

  # def game_params
  #   params.require(:game).permit(:game_id)
  # end
end
