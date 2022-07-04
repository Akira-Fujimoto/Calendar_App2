class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans or /plans.json
  def index
    @plans = Plan.all
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    #@plans = Plan.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  # GET /plans/1 or /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans or /plans.json
  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to plan_url(@plan), notice: "予定が作成されました" }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to plan_url(@plan), notice: "予定が更新されました" }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url, notice: "予定を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:title, :start_time)
    end
end
