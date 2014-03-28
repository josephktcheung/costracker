require 'pry'

class ItemsController < ApplicationController

  before_action :is_authenticated?

  def index
    @items = Item.all.entries
  end

  def show
    @item = Item.find_by(id: params[:id])
    @best_seller = @item.sellers.min { |a, b| a.today_price <=> b.today_price }
  end

  def new
    @item = Item.new
    @item.sellers.build
    @currencies = Seller.accepted_currencies_objects
  end

  def create
    @item = current_user.items.create(name: params[:item][:name], description: params[:item][:description])
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
    puts params
    @seller = Seller.get_temp_price_and_stock(params[:url], params[:price_tag], params[:currency], params[:stock_tag])
    @price_id = params[:price_id]
    @stock_id = params[:stock_id]
    respond_to do |format|
      # format.html { redirect_to :edit }
      format.js
    end
  end

  private

    def item_params
      attributes = [
        :name,
        :description,
        :image_url,
        sellers_attributes:
        [
          :id,
          :url,
          :name,
          :currency,
          :price_tag,
          :stock_tag,
          :_destroy
        ]
      ]
      params.require(:item).permit(attributes)
    end
end