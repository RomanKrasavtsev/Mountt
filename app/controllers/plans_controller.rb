class PlansController < ApplicationController
  def index
    @plans = current_user.family.plan.all
  end

  def create
    @plan = current_user.family.plan.new(plan_params)

    if @plan.save
      redirect_to plans_path
    else
      render "index"
    end
  end

  def destroy
    @plan = current_user.family.plan.find(params[:id])

    if @plan.destroy
      redirect_to plans_path
    else
      render "index"
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:item_id, :value)
  end
end
