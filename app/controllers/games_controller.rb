class GamesController < ApplicationController
            #before_action :set_games, [:show, :update, :destroy, :games]
        #before_action :authenticate_request

        def index
            games = Game.all 
            render json: games, status: :ok
          end
  
          def show
            render json: @game, status: :ok
          end
  
          def create
            game = @current_user.games.new(user_params)
  
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
            @game = Game.find(params[:id] || params[:game_id])
          end
        
          def game_params
            #permit only allows the parameters included in the argument
            params.permit(:content)
          end
end
