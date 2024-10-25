class DefinitionsController < ApplicationController
    before_action :set_definitions, only:[:show, :update, :destroy]
  
    def index
      definitions = Definition.all
      render json: contents, status: :ok
    end
  
    def show
      render json: @definition, status: :ok
    end
  
    def create
      definition = Definition.new(params)
  
  
      if definition.save
        render json: definition, status: :created
      else
        render json: definition.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @definition.update(params)
        render json: @definition, status: :ok
      else
        render json: @definition.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @definition.destroy
        render json: nil, status: :ok
      else
        render json: @definition.errors, status: :unprocessable_entity
      end
    end
  
    private
    
    def set_definitions
      @definition = Definition.find(params[:id])
    end
end
