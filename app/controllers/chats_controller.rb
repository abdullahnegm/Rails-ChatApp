class ChatsController < ApplicationController
    before_action :require_user

    def new
        @messages = Chat.all
        @chat = Chat.new
    end

    def create
        message = current_user.chats.build(chat_params)
        if message.save
            ActionCable.server.broadcast("chatroom_channel", {message_mod: render_message(message)})
        end
    end

    private
    def render_message(message)
        render(partial: 'chat', locals: {chat: message})
    end

    def chat_params
        params.require(:chat).permit(:message)
    end

end