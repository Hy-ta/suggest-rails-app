# App.room = App.cable.subscriptions.create "RoomChannel",
#   connected: ->
#     # Called when the subscription is ready for use on the server

#   disconnected: ->
#     # Called when the subscription has been terminated by the server

#   received: (data) ->
#      $('#messages').append data['message']

#   speak: (message) ->
#     @perform 'speak', message: message

# $('#chat-input').on 'keypress', (event) ->
#   if event.keyCode is 13
#     App.room.speak event.target.value
#     event.target.value = ''
#     event.preventDefault()
