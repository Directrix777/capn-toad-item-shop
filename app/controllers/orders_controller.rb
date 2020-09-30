class OrdersController < ApplicationController
    def new
        @order = Order.new
        @item = Item.find(params[:item_id])
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            @order.send_order
            redirect_to '/'
        else
            @item = Item.find(params[:item_id])
            render 'new'
        end
    end

    def index
        admin_only
        @orders = Order.all
        if params[:id]
            @orders = @orders.where(item_id: params[:item_id])
        end
    end

    def destroy
        admin_only
        @order = Order.find(params[:id])
        @order.delete
        if params[:item_id]
            redirect_to item_orders_path
        else
            redirect_to orders_path
        end
    end

    private

    def order_params
        params.require(:order).permit(:amount, :user_id, :item_id)
    end

end
