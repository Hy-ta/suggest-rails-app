class RoomsController < ApplicationController

    def new
      @room = Room.new
    end

    def show
      @room = Room.find(params[:id])
      @room.user_id = current_user.id
    end


    private

    def room_params
        params.require(:room).permit(:user1, :user2, :user_id, :content)
    end
      
end
