class GamesController < ApplicationController
  def index
    if params[:room_code]
      @game = Game.find_by(room_code: params[:room_code])
      @player = Player.new(avatar_url: Player::AVATARS.sample)
      @player.game = @game
      @player.user = current_user
      if @player.save
        GameChannel.broadcast_to(
          @game,
          render_to_string(partial: "players/player", locals: {player: @player})
        )
        redirect_to game_path(@game)
        # head :ok
      else
        render :index, status: :unprocessable_entity
      end
    else
      flash[:error] = "Game not found"
      render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    # @game_first = Game.first
    # @dilemmas = @game_first.dilemmas
    # @game_first.dilemmas.update_all(game_id: @game.id)
    # @game.dilemmas << @dilemmas
    # @dilemma = @game.dilemmas.first
  end

  def create
    room_code = [('A'..'Z')].map(&:to_a).flatten
    room_code_string = (0...4).map { room_code[rand(room_code.length)] }.join
    game = Game.create(room_code: room_code_string, user: current_user)
    if game.save
      player = Player.new(avatar_url: Player::AVATARS.sample)
      player.game = game
      player.user = current_user
      if player.save
        redirect_to game_path(game)
      else
        render :home
      end
    else
      flash[:error] = "Game not found"
      render :index
    end
  end
end
