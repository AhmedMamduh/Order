module Api::V1
  class MainOrdersController < ApplicationController
    before_action :set_order, only: %i[update]

    def index
      orders = @current_user.main_orders
      render json: { orders: orders }
    end

    def create
      order = @current_user.main_orders.new
      total_price = 0
      params[:products].each do |product|
        order.order_details.new(product_id: product[:id], quantity: product[:quantity])
        total_price += Product.find_by(id: product[:id]).price.to_f * product[:quantity]
      end
      order.total_price = total_price
      if order.save
        render json: order, status: 201
      else 
        render json: { errors: order.errors.full_messages.first }, status: 400
      end
    end

    def update
      render json: { msg: "Status is required" }, status: 400 and return unless params[:status]
      status = MainOrder.statuses[params[:status].downcase]
      render json: { msg: "Wrong Status" }, status: 400 and return unless status
      if @order.update(status: status)
        render json: @order
      else 
        render json: { errors: @order.errors.full_messages.first }, status: 400
      end
    end

    private
    def set_order
      @order = MainOrder.find(params[:id])
      render json: { msg: "Order not found" }, status: 404 and return unless @order
    end

  end
end
