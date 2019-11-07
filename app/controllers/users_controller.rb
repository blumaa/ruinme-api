class UsersController < ApplicationController

  def sign_up
    user = User.new(params)
    if user.save
      render json: {message: "user signed up!", data: user}
    else
      render json: {message: "oh no!", data: user.errors.full_messages}
    end
  end

  def index
    users = User.all
    render json: {message: 'all users', data: users}
  end

  def profile
    user = User.find_by(id: params[:id])
    render json: {message: "user #{user.id} name #{user.display_name}", data: user}
  end

  def relationships
    user  = User.find_by(id: params[:id])
    relationships = user.relationships
    render json: {message: "user's relationships", data: relationships}
  end

end
