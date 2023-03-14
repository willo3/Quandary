class DilemmasController < ApplicationController
  def show
    # @game_first = Game.first
    # @dilemmas = @game_first.dilemmas
    # @game = Game.find(params[:id])
    # @game.dilemmas = @dilemmas
    @game = Game.find(params[:game_id])
    @dilemma = Dilemma.find(params[:id])
    @dilemmas = @game.dilemmas
    # @dilemma.game = @game

    puts "GAMEID"
    puts @game.id

    if @game.user == current_user
      GameChannel.broadcast_to(
        @game,
        game_dilemma_url(@game)
      )
    end
  end

  def create

    @game = Game.find(params[:game_id])
    @scenarios = Scenario.all.to_a.shuffle

    @dilemmas = (1..10).map {
      @dilemma = Dilemma.new
      @dilemma.game = @game
      @dilemma.save
      @dilemma.scenarios << @scenarios.shift
      @dilemma.scenarios << @scenarios.shift
      @dilemma
    }
    redirect_to game_dilemma_path(@game, @dilemmas.first)
  end
end






# ? if 1st dilemma , then load dilemma as Dilemma.find(params:dilemma_id)   /    else load dilemma as Dilemma.find(params:dilemma_id +1
# on results show page, clicking next, the next button links to current dilemma +1
