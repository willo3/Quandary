class DilemmasController < ApplicationController
  def show
    # @game_first = Game.first
    # @dilemmas = @game_first.dilemmas
    # @game = Game.find(params[:id])
    # @game.dilemmas = @dilemmas
    @game = Game.find(params[:game_id])
    @dilemma = Dilemma.find(params[:id])

    @dilemmas = @game.dilemmas
    # TEMPORARY
    @old_dilemma = Dilemma.find(@dilemma.id - 1)
    # @dilemma.game = @game

    puts "GAMEID"
    puts @game.id

    if @game.user == current_user
      GameChannel.broadcast_to(
        @game,
        game_dilemma_url(@game)
      )

      DilemmaChannel.broadcast_to(
        @old_dilemma,
        game_dilemma_url(@game, @dilemma)
      )
    end


  end

  def create

    @game = Game.find(params[:game_id])
    @dilemmas = @game.dilemmas
    if @dilemmas.empty?
      @scenarios = Scenario.all.to_a.shuffle
      @dilemmas = (1..5).map {
        @dilemma = Dilemma.new
        @dilemma.game = @game
        @dilemma.save
        @dilemma.scenarios << @scenarios.shift
        @dilemma.scenarios << @scenarios.shift
        @dilemma
      }
    end
    redirect_to game_dilemma_path(@game, @dilemmas.first)
  end
end
