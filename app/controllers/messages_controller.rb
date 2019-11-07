class MessagesController < ApplicationController

  def index
    relationship = Relationship.find_by(id: params[:id])
    messages = relationship.messages
    render json: {message: "message from the relationship #{relationship.id}", data: messages}
  end

  def create
    relationship = Relationship.find_by(id: params[:relationship_id])
    if relationship.user_1_id == params[:sender_id]
      receiver_id = relationship.user_2_id
    elsif relationship.user_2_id == params[:sender_id]
      receiver_id = relationship.user_1_id
    end
    new_message = relationship.messages.build(sender_id: params[:sender_id], receiver_id: receiver_id, content: params[:content])
    render json: {message: "You've got mail", data: new_message}
  end



end
