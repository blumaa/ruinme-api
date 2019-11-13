class MessagesController < ApplicationController

  def index
    relationship = Relationship.find_by(id: params[:id])
    messages = relationship.messages
    render json: {message: "message from the relationship #{relationship.id}", data: messages}
  end

  def create
    sender = current_user
    relationship = Relationship.find_by(id: params[:relationship_id])
    receiver = sender == relationship.user_1 ?  relationship.user_2 : relationship.user_1
    new_message = relationship.messages.build(sender_id: sender.id, receiver_id: receiver.id, content: params[:content])
    if new_message.save
      render json: {data: new_message}
    else
      render json: {message: 'failed to send message'}
    end
  end



end
