class RelationshipsController < ApplicationController

  def create

    rel = Relationship.find_or_create_by(pending: true, user_1: current_user, user_2_id: params[:user_id])
    if rel.valid?
      render json: {user: rel.user_2, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    else
      render json: {message: "lone wolf!", data: relationship.errors.full_messages}
    end
  end

  def accept_or_decline
    relationship = Relationship.find_by(id: params[:relationship_id])
    if params[:decision] == "accept"
      relationship.pending = true
      relationship.save
      render json: {message: "relationship accepted", data: relationship}
    elsif params[:decision] == "decline"
      relationship.destroy
      render json: {message: "relationship declined", data: relationship}
    else
      render json: {message: 'decision undefined'}
    end
  end
end
