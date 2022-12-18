App.chat = App.cable.subscriptions.create('ChatChannel', {
  connected: function() {
    console.log('connected.')
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected.')
  },

  received: function(data) {
    console.log('recieved.')
    // Called when there's incoming data on the websocket for this channel
    this.appendLine(data)
    if (data.body === 'disconnected.') {
      $('[data-chat-room="Best-Room"]').html('')
      console.log('Cleanup')
    }
    console.log(data)
  },

  appendLine: function (data) {
    var html = this.createLine(data)
    console.log(data)
    $('[data-chat-room="Best-Room"]').append(html)
  },

  createLine: function (data) {
    return ''.concat(
      '<article class="chat-line">',
        '<span class="speaker">', data.sent_by, '</span>',
        ': ',
        '<span class="body">', data.body, '</span>',
      '</article>'
    )
  }
});

console.log('chat.js')