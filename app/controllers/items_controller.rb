class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.family.item.all
  end

  def create
    @item = current_user.family.item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render 'index'
    end
  end

  def destroy
    @item = current_user.family.item.find(params[:id])

    if @item.destroy
      redirect_to items_path
    else
      render "index"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
