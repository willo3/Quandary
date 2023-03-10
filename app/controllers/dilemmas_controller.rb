class DilemmasController < ApplicationController
  def show
    # @game_first = Game.first
    # @dilemmas = @game_first.dilemmas
    # @game = Game.find(params[:id])
    # @game.dilemmas = @dilemmas
    @game = Game.find(params[:game_id])
    @dilemma = Dilemma.find(params[:id])
    # @dilemma.game = @game

  end


end

# ? if 1st dilemma , then load dilemma as Dilemma.find(params:dilemma_id)   /    else load dilemma as Dilemma.find(params:dilemma_id +1
# on results show page, clicking next, the next button links to current dilemma +1
