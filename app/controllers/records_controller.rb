class RecordsController < ApplicationController
  def index
    @family = Family.find(1)
    @current_user = @family.user.find(1)
    @records = @family.record.all.order(:date)
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to records_path
    else
      render 'index'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:date, :description, :item_id, :value, :user_id)
  end
end
