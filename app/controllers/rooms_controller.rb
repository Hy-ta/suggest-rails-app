class RoomsController < ApplicationController

    def new
      @room = Room.new
    end

    def show
      @room = Room.find(params[:id])
      @message = Message.new
    end


    private

    def room_params
        params.require(:room).permit(:user1, :user2, :user_id, :content)
    end
      
end
