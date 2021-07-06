class Api::V1::ScoresController < ApplicationController


  # GET /api/v1/scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /api/v1/scores/1
  def show
    render json: @score
  end

  # POST /api/v1/scores
  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/scores/1
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/scores/1
  def destroy
    @score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:score, :user_id)
    end
end
