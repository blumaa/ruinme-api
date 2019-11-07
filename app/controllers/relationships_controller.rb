class RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new(params)
    if relationship.save
      render json: {message: "relationship created", data: relationship}
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
