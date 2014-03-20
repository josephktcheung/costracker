class ItemsController < ApplicationController
  before_action :is_authenticated?
  def index
    @items = Item.all.entries
  end

  def new
    @item = Item.new
    @item.sellers.build
  end

  def create
    @item = current_user.items.create(name: params[:item][:name], description: params[:item][:description])
    redirect_to items_url, notice: "New wishlist item created!"
  end

  def edit
    @item = Item.find(params[:id])
    @item.sellers.build
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
      attributes = [
        :name,
        :description,
        :image_url,
        sellers_attributes:
        [
          :_destroy,
          :id,
          :url,
          :name
        ]
      ]
      params.require(:item).permit(attributes)
    end
end