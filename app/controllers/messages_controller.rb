class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @league = League.find(params[:league_id])
    @message.league = @league
    @message.user = current_user
    @message.save
    redirect_to league_path(@league)
  end

  private

  def message_params
    params.require(:message).permit(:comment)
  end
end
