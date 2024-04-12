class ScoresController < ApplicationController
    before_action :set_scores, only: [:show, :update, :destroy]
    before_action :set_game, only: [:create]
    #before_action :authenticate_request
  
    def index
      scores = Score.all 
      render json: scores, status: :ok
    end
  
    def show
      gameScores = Score.where(game_id: params[:id])
      render json: gameScores, status: :ok
      #render json: ScoresBlueprint.render(@score, view: :normal), status: :ok
    end
  
    def create
      score = @current_game.scores.new(user_params)
      if score.save
        render json: @score, status: :created
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @score.update(score_params)
        render json: @score, status: :ok
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @score.destroy
        render json: nil, status: :ok
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_game
      @current_game = Game.find(params[:game_id])
    end

    def set_scores
      @score = Score.find(params[:id])
    end
  
    def score_params
      #permit only allows the parameters included in the argument
      params.permit(:content)
    end
end
