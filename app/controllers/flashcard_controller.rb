class FlashcardController < ApplicationController
  before_action :set_flashcards, only: [:show, :update, :destroy]

  def index
    flashcards = flashcards.order(created_at: :desc).page(params[:page]).per(12)
    render json: {
      flashcard: FlashcardBlueprint.render_as_hash(games, view: :normal),
      total_pages: flashcards.total_pages,
      current_page: flashcards.current_page
    }, status: :ok
  end

  def show
    render json: @flashcard, status: :ok
  end

  def create
    new_definition = Definition.create(definition: params[:defintion])
    flashcard = $current_user.flashcards.new(name: params[:title], definition_id: new_definition.id)

    if flashcard.save
      render json: flashcard, status: :created
    else
      new_definition.destroy
      render json: flashcard.errors, status: :unprocessable_entity
    end

  end

  private

  def set_flashcards
    @flashcard = Flashcard.find(params[:id])
  end
end
