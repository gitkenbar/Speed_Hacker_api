class GamesController < ApplicationController
  before_action :set_games, only: [:show, :update, :destroy]
  #before_action :authenticate_request, only: [:create]

  def index
    games = Game.order(created_at: :desc).page(params[:page]).per(12)
    render json: {
      games: GamesBlueprint.render_as_hash(games, view: :normal),
      total_pages: games.total_pages,
      current_page: games.current_page
    }, status: :ok
  end

  def show
    render json: @game, status: :ok
  end

  def create
    new_content = Content.create(challenge: params[:content])
    game = $current_user.games.new(name: params[:title], content_id: new_content.id)

    if game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(game_params)
      render json: @game, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @game.destroy
      render json: nil, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  private

  def set_games
    @game = Game.find(params[:id])
  end

end
