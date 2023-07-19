class StoreController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    if session[:counter].nil?
      session[:counter] = 1 # Initialize the counter to 1 if it doesn't exist
    else
      session[:counter] += 1 # Increment the counter if it exists
    end

    @counter = session[:counter]
  end
end
