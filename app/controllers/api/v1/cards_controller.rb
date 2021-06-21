class Api::V1::CardsController < ApplicationController
    def index
        @cards = Card.order(:created_at)
        render json: @cards, status: 200
    end
    
    def create
        @card = Card.create(deck_params)
        render json: @card, status: 201
    end
    
    def destroy
        card = Card.find(params[:id])
        if card.destroy
          render json: {cardId: card.id}, status: 200
        end
    end
    
    def update
        @card = Card.find(params[:id])
        if @card.update(card_params)
          render json: @card, status: 200
        end
    end
    
    private
        def card_params
          params.require(:card).permit(:body)
        end
end
