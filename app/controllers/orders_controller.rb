class OrdersController < ApplicationController
  def index
    @orders= Order.all
  end

  def create
    order = Order.new(order_params)
    order.shipping_date = 2.days.from_now
    order.save

    params[:order][:line_items].each do |line_item|
      order.line_items.create(line_item.to_hash)
    end


    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address)
  end


end
