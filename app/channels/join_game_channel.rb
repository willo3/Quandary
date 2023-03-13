class JoinGameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @game = Game::Room[params[:game_id]]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
