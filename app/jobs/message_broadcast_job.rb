class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActiveCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.render.render(partial: 'messages/message', local: {message: message})
  end
end
