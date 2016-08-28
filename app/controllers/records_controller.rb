class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = current_user.family.record.all
  end

  def create
    @record = current_user.family.record.new(record_params)

    if @record.save
      redirect_to records_path
    else
      render 'index'
    end
  end

  def destroy
    @record = current_user.family.record.find(params[:id])

    if @record.destroy
      redirect_to records_path
    else
      render "index"
    end
  end

  private

  def record_params
    params.require(:record).permit(:date, :description, :item_id, :value, :user_id)
  end
end
