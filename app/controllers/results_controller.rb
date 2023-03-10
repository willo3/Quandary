class ResultsController < ApplicationController
  def index
    @dilemma = Dilemma.find(params[:dilemma_id])
    @result_a = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.first))
    @result_b = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.second))
  end

  def new
    # raise
    @user = current_user
    @dilemma = Dilemma.find(params[:dilemma_id])
    @scenario = Scenario.find(params[:scenario_id])
    @result = Result.new(user: @user, dilemma: @dilemma, scenario: @scenario)
    @game = Game.find(params[:game_id])
    if @result.save!
      redirect_to game_dilemma_results_path(@game, @dilemma)
    else
      redirect_to game_dilemma_path(@game, @dilemma)
    end
  end
end
