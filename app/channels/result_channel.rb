class ResultChannel < ApplicationCable::Channel
  def subscribed
    result = Result.find(params[:id])
    stream_for result
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
