class RoomsController < ApplicationController

    def index
      @rooms = Room.all
     
    end

    def new
      @room = Room.new
    end

    def show
      @room = Room.find(params[:id])
      if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
        @messages = @room.messages
        @entries = @room.entries
      else
        redirect_to root_path
      end
    end

    def create
      @room = Room.new(:name => "DM")
      @entry1 = Entry.create(:room_id => current_user.id)
      @entry2 = Entry.create(params.require(:entry).permit(:user_id).merge(:room_id => @room.id))
      redirect_to room_path(@room.id)
    end

    def top
      if user_signed_in? 
        @room = Room.new
        @rooms = current_user.rooms
        @rooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
      end
    end


    private

    def room_params
        params.require(:room).permit(:name, :user_id)
    end
      
end
