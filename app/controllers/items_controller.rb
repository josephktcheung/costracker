require 'pry'

class ItemsController < ApplicationController

  before_action :is_authenticated?
  before_action :set_user

  def index
    @items = @user.items
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @item.sellers.build
    @currencies = Seller.accepted_currencies_objects
  end

  def create
    @item = @user.items.create(item_params)
    redirect_to items_url, notice: "New wishlist item created!"
  end

  def edit
    @item = Item.find(params[:id])
    @currencies = Seller.accepted_currencies_objects
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

  def fetch_details
    @seller = Seller.get_temp_price_and_stock(
        params[:url],
        params[:price_tag],
        params[:currency],
      )
    @price_id = params[:price_id]
    respond_to do |format|
      # format.html { redirect_to :edit }
      format.js
    end
  end

  private

    def item_params
      attributes = [
        :name,
        :image_url,
        :temp_price,
        sellers_attributes:
        [
          :id,
          :url,
          :name,
          :currency,
          :temp_price,
          :price_tag,
          :_destroy
        ]
      ]
      item_params = params.require(:item).permit(attributes)
      item_params[:temp_price] = item_params[:temp_price].to_f
      item_params
    end

    def set_user
      @user = current_user
    end
end