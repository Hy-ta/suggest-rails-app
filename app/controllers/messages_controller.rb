class MessagesController < ApplicationController
  

  private
  def message_params
    params.require(:message).permit(:sender_id, :user_id, :room_id)
  end
  
end
