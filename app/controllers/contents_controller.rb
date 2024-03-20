class ContentsController < ApplicationController
                before_action :set_contents, [:show, :update, :destroy, :contents]
        #before_action :authenticate_request

        def index
            contents = Content.all 
            render json: contents, status: :ok
          end
  
          def show
            render json: @content, status: :ok
          end
  
          def create
            content = @current_user.contents.new(user_params)
  
            if content.save
              render json: @content, status: :created
            else
              render json: @content.errors, status: :unprocessable_entity
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
            @content = Content.find(params[:content_id])
          end
        
          def content_params
            #permit only allows the parameters included in the argument
            params.permit(:content)
          end
end
