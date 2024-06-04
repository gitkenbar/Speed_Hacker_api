class ContentsController < ApplicationController
        before_action :set_contents, only:[:show, :update, :destroy]
        before_action :set_user, only:[:create]
        #before_action :authenticate_request

        def index
          contents = Content.all 
          render json: contents, status: :ok
        end
  
        def show
          render json: @content, status: :ok
        end

        def create
          content = @user.Content.new(user_params)

          if content.save
            render json: content, status: :created
          else
            render json: content.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @content.update(content_params)
            render json: @content, status: :ok
          else
            render json: @content.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          if @content.destroy
            render json: nil, status: :ok
          else
            render json: @content.errors, status: :unprocessable_entity
          end
        end

        private
      
        def set_contents
          @content = Content.find(params[:id])
        end

        def set_user
          @user = User.find(params[:id])
        end
      
        def content_params
          #permit only allows the parameters included in the argument
          params.permit(:content)
        end
end
