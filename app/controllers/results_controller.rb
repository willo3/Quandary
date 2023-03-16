class ResultsController < ApplicationController
  def index
    @dilemma = Dilemma.find(params[:dilemma_id])
    @result_a = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.first))
    @result_b = Result.where(dilemma: @dilemma).and(Result.where(scenario: @dilemma.scenarios.second))
    @next_dilemma = Dilemma.where("id > ?", @dilemma.id).order(id: :asc).first
    @user = current_user
    result = Result.where(dilemma: @dilemma).and(Result.where(user: @user))
    @scenario = result.last.scenario
    @results_total = @result_a.length + @result_b.length
    @players_total = Game.find(params[:game_id]).player_count
    @game = @dilemma.game


    if @players_total == @results_total
      if @result_a.length > @result_b.length && @scenario.content == @result_a.first.scenario.content
        @user.score += 1
      elsif @result_b.length > @result_a.length && @scenario.content == @result_b.first.scenario.content
        @user.score += 1
      end
      @user.score
      @user.save
    end

    # creating a message and broadcasting
    message = {
      players: @players_total,
      result_a: @result_a.count,
      result_b: @result_b.count,
      results: @results_total,
      score: @user.score
    }
    DilemmaChannel.broadcast_to(@dilemma, message)
  end

  def new
    @user = current_user
    @dilemma = Dilemma.find(params[:dilemma_id])
    @scenario = Scenario.find(params[:scenario_id])
    @game = Game.find(params[:game_id])
    @result = Result.new(user: @user, dilemma: @dilemma, scenario: @scenario)
    @player = current_user.players.find_by(game: @game)
    # @player_avatar = @player.avatar_url

    if @result.save!
      DilemmaChannel.broadcast_to(
        @dilemma,
        # "#{current_user.name} chose: #{@scenario.content}"
        render_to_string(partial: "players/player", locals: { player: @player, scenario: @scenario })
      )
      redirect_to game_dilemma_results_path(@game, @dilemma)
    else
      redirect_to game_dilemma_path(@game, @dilemma)
    end
  end
end
