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
end