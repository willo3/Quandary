class DilemmaChannel < ApplicationCable::Channel
  def subscribed
    dilemma = Dilemma.find(params[:id])
    stream_for dilemma
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
