class ResultsController < ApplicationController
  def index
    @dilemma = Dilemma.find(params[:dilemma_id])
    @result_a = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.first))
    @result_b = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.second))
    @next_dilemma = Dilemma.where("id > ?", @dilemma.id).order(id: :asc).first
  end

  def new
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

# def show
#   @game = Game.find(params[:game_id])
#   @users = User.find_by(@game)
#   @dilemmas = Dilemma.find_by(@game).to_a
#   dilemma_ids = @dilemmas.map {|dilemma|
#     dilemma.id
#   }
#   results = Results.where(:dilemma_id [dilemma_ids]).to_a
# end
