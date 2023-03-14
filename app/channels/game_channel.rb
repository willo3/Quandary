class GameChannel < ApplicationCable::Channel
  # @counter = 1

  def subscribed
    game = Game.find(params[:id])
    stream_for game
    # @counter += 1
  end

  def connections_info
    connections_array = []
    connection.server.connections.each do |conn|
      conn_hash = {}
      conn_hash[:current_user] = conn.current_user
      conn_hash[:subscriptions_identifiers] = conn.subscriptions.identifiers.map { |k| JSON.parse k }
      connections_array << conn_hash
    end
    connections_array
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
