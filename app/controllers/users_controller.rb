class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    puts user_params
    user = User.new(user_params)
    puts user
    if user.save
      token = encode_token({ user_id: user.id})
      render json: {message: "user signed up!", user: UserSerializer.new(user), token: token}
    else
      render json: {message: "oh no! sign up failed", data: {errors: user.errors.full_messages}}
    end
  end

  def index
    users = User.all.map {|user| UserSerializer.new(user)}
    render json: {message: 'all users', data: users}
  end

  def profile
    user = User.find_by(id: params[:id])
    render json: {message: "user #{user.id} name #{user.display_name}", data: UserSerializer.new(user)}
  end

  def relationships
    user  = User.find_by(id: params[:id])
    relationships = user.relationships
    render json: {message: "user's relationships", data: relationships}
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :display_name, :age, :bio, :gender,:looking_for, :zip_code)
  end

end
