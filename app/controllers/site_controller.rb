class SiteController < ApplicationController
  def index
    redirect_to items_url if current_user
  end
  def privacy
  end
  def terms
  end
end
