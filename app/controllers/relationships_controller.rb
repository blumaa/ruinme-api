class RelationshipsController < ApplicationController

  def create

    rel = Relationship.find_or_create_by(pending: true, user_1: current_user, user_2_id: params[:user_id])
    puts "*********current_user id**************"
    puts current_user.id

    puts "*********user 1 requester**************"
    puts rel.user_1.id

    puts "*********user 2 receiver**************"
    puts rel.user_2.id

    if rel.valid?
      render json: {receiver: rel.user_2, requester: rel.user_1, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    else
      render json: {message: "lone wolf!", data: relationship.errors.full_messages}
    end
  end

  def accept_or_decline
    rel = Relationship.find_by(id: params[:relationship_id])
    if params[:decision] == "accept"
      rel.pending = false
      rel.save
      render json: {decision: 'accepted', requester: rel.user_1, receiver: current_user, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    elsif params[:decision] == "decline"
      rel.destroy
      render json: {decision: 'declined', requester: rel.user_1, receiver: current_user, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    else
      render json: {message: 'decision undefined'}
    end
  end
end
