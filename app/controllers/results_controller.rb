class ResultsController < ApplicationController
  def index
    @dilemma = Dilemma.find(params[:dilemma_id])
    @result_a = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.first))
    @result_b = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.second))
    @next_dilemma = Dilemma.where("id > ?", @dilemma.id).order(id: :asc).first
    @user = current_user
    result = Result.where(dilemma: @dilemma).and(Result.where(user: @user))
    @scenario = result.last.scenario
    @results_total = @result_a.count + @result_b.count
    @players_total = Game.find(params[:game_id]).player_count
    @game = @dilemma.game

    if @players_total == @results_total
      # This isn't working for now - Jake
  #     # need to add some logic to make this work even if only one answer has been chosen by everyone

      if @result_a.count > @result_b.count && @scenario.content == @result_a.first.scenario.content
        @user.score += 1

      elsif @result_b.count > @result_a.count && @scenario.content == @result_b.first.scenario.content
        @user.score += 1
      end
      @user.score
      @user.save
    end
  end

  def new
    @user = current_user
    @dilemma = Dilemma.find(params[:dilemma_id])
    @scenario = Scenario.find(params[:scenario_id])
    @game = Game.find(params[:game_id])
    @result = Result.new(user: @user, dilemma: @dilemma, scenario: @scenario)
    if @result.save!
      DilemmaChannel.broadcast_to(
        @dilemma,
        "#{current_user.name} chose: #{@scenario.content}"
      )
      redirect_to game_dilemma_results_path(@game, @dilemma)
    else
      redirect_to game_dilemma_path(@game, @dilemma)
    end
  end
end
