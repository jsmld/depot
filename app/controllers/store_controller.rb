class StoreController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    if session[:counter].nil?
      session[:counter] = 1 # Initialize the counter to 1 if it doesn't exist
    else
      session[:counter] += 1 # Increment the counter if it exists
    end

    @counter = session[:counter]
  end
end
