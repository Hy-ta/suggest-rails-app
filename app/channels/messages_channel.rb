class MessagesChannel < ApplicationCable::Channe
    def subscribed
        stream_from 'messages'
    end
end