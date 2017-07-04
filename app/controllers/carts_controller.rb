class CartsController < ApplicationController

  def show
    set_cart
    render 'carts/checkout' if @current_cart.status == "submitted"
  end

  def checkout
    set_cart
    current_user.current_cart = nil
    @current_cart.update(status: "submitted")
    update_inventory
    redirect_to cart_path(@current_cart)
  end  

  private

  def set_cart
    @current_cart = Cart.find_by(id: params[:id])
  end  

  def update_inventory
    @current_cart.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end
  end
  
end
