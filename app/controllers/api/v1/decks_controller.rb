class Api::V1::DecksController < ApplicationController

    def index
        @decks = Deck.order(:created_at)
        render json: @decks, status: 200
    end
    
    def create
        @deck = Deck.create(deck_params)
        render json: @deck, status: 201
    end
    
    def destroy
        deck = Deck.find(params[:id])
        if deck.destroy
          render json: {deckId: deck.id}, status: 200
        end
    end
    
    def update
        @deck = Deck.find(params[:id])
        if @deck.update(deck_params)
          render json: @deck, status: 200
        end
    end
    
    private
        def deck_params
          params.require(:deck).permit(:body)
        end
end
