class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  #before_action :authenticate_request, only: [ :show, :update, :destroy]

  def index
    users = User.all

    render json: users, status: 200
  end

  def show
    render json: UserBlueprint.render(@user, view: :normal), status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if user.destroy
      render json: nil, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def games_index
    user = User.find(params[:user_id])
    user_games = user.games

    render json: user_games, status: :ok
  end
  def games_home
    user = User.find(params[:user_id])
    user_games = user.games.order("created_at DESC").limit(7)

    render json: user_games, status: :ok
  end


  def scores_index
    user = User.find(params[:user_id])
    user_scores = user.scores

    render json: user_scores, status: :ok
  end

  def scores_home
    user = User.find(params[:user_id])
    user_scores = user.scores.order("created_at DESC").limit(7)

    render json: user_scores, status: :ok
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    #permit only allows the parameters included in the argument
    params.permit(:username, :password, :password_confirmation)
  end
end
