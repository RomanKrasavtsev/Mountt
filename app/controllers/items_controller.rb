class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @family = Family.find(1)
    @current_user = @family.user.find(1)
    @items = @family.item.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render 'index'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :family_id)
  end
end
