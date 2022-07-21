class BetsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_bet, only: %i[ show update destroy ]

  # GET /bets
  def index
    @bets = Bet.all

    render json: @bets
  end

  # GET /bets/1
  def show
    render json: @bet
  end

  # POST /bets
  def create
    @bet = Bet.new(bet_params)

    if @bet.save
      render json: @bet, status: :created, location: @bet
    else
      render json: @bet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bets/1
  def update
    if @bet.update(bet_params)
      render json: @bet
    else
      render json: @bet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bets/1
  def destroy
    @bet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:result, :move, :dozens, :simulations, :Game_id)
    end
end
