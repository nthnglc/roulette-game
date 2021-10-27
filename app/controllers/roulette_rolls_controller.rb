class RouletteRollsController < ApplicationController
  before_action :set_roulette_roll, only: %i[ show edit update destroy ]

  # GET /roulette_rolls or /roulette_rolls.json
  def index
    @roulette_rolls = RouletteRoll.all
  end

  # GET /roulette_rolls/1 or /roulette_rolls/1.json
  def show
  end

  # GET /roulette_rolls/new
  def new
    @roulette_roll = RouletteRoll.new
  end

  # GET /roulette_rolls/1/edit
  def edit
  end

  # POST /roulette_rolls or /roulette_rolls.json
  def create
    @roulette_roll = RouletteRoll.new(roulette_roll_params)

    respond_to do |format|
      if @roulette_roll.save
        format.html { redirect_to @roulette_roll, notice: "Roulette roll was successfully created." }
        format.json { render :show, status: :created, location: @roulette_roll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @roulette_roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roulette_rolls/1 or /roulette_rolls/1.json
  def update
    respond_to do |format|
      if @roulette_roll.update(roulette_roll_params)
        format.html { redirect_to @roulette_roll, notice: "Roulette roll was successfully updated." }
        format.json { render :show, status: :ok, location: @roulette_roll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @roulette_roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roulette_rolls/1 or /roulette_rolls/1.json
  def destroy
    @roulette_roll.destroy
    respond_to do |format|
      format.html { redirect_to roulette_rolls_url, notice: "Roulette roll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roulette_roll
      @roulette_roll = RouletteRoll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def roulette_roll_params
      params.require(:roulette_roll).permit(:color, :user, :forecast, :amount)
    end
end
