class ItemsController < ApplicationController
  before_action :is_authenticated?
  def index
    @items = Item.all.entries
  end
  def new
    @item = Item.new
  end
  def create
    @item = current_user.items.create(name: params[:item][:name], description: params[:item][:description])
    redirect_to items_url, notice: "New wishlist item created!"
  end
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_url
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to items_url
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end