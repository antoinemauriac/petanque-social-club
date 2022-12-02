class MessagesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @message = Message.new
  end

  def create
    @league = League.find(params[:league_id])
    @message = Message.new(message_params)
    @message.league = @league
    @message.user = current_user
    @message.save
    redirect_to league_messages_path(@league)
  end

  private

  def message_params
    params.require(:message).permit(:comment)
  end
end
