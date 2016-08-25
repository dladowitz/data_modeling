class OrdersController < ApplicationController
  before_action :set_order, only: :show

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

  def show
    if @order
      render :show
    else
      flash[:danger] = "That order is not in the database"
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address)
  end

  def set_order
    @order = Order.find_by_id params[:id]
  end
end
