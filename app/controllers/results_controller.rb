class ResultsController < ApplicationController
  def index
    @dilemma = Dilemma.find(params[:dilemma_id])
    @result_a = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.first))
    @result_b = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.second))
    @next_dilemma = Dilemma.where("id > ?", @dilemma.id).order(id: :asc).first
    @user = current_user
    result = Result.where(dilemma: @dilemma).and(Result.where(user: @user))
    @result = result.last.scenario

    # How do I count the scenarios?
    if @dilemma.scenarios.count == (@result_a.count + @result_b.count)
      html = render_to_string(partial: "players/player_count", formats: [:html])
      ResultChannel.broadcast_to(@dilemma, html)
    end

    # This is currently working, kinda
    if @result_a.count > @result_b.count && @result.content == @result_a.first.scenario.content
      @user.score += 1
    elsif @result_b.count > @result_a.count && @result.content == @result_b.first.scenario.content
      @user.score += 1
    end
    @user.score
    @user.save
  end

  def new
    @user = current_user
    @dilemma = Dilemma.find(params[:dilemma_id])
    @scenario = Scenario.find(params[:scenario_id])
    @game = Game.find(params[:game_id])
    @result = Result.new(user: @user, dilemma: @dilemma, scenario: @scenario)
    if @result.save!
      redirect_to game_dilemma_results_path(@game, @dilemma)
    else
      redirect_to game_dilemma_path(@game, @dilemma)
    end
  end
end
