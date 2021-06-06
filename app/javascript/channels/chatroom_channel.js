import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    // document.getElementById('users').value += `
    // <div class="badge bg-primary text-wrap" style="width: 6rem;">
    //   ${current_user}.
    // </div>
    // `
    console.log("hey")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let doc = document.getElementById('messages')
    doc.insertAdjacentHTML('beforeend', data.message_mod)
    document.getElementById('message').value = ''
  }
});

