class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        admin_only
        @item = Item.new
    end

    def create
        admin_only
        @item = Item.new(item_params)
        if @item.save
            redirect_to item_path(@item)
        else
            render 'new'
        end
    end

    def edit
        admin_only
        @item = Item.find(params[:id])
    end

    def update
        admin_only
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to item_path(@item)
        else
            render 'edit'
        end
    end

    def delete
        admin_only
        @item = @item = Item.find(params[:id])
        @item.delete
        redirect_to items_path
    end

    private

    def item_params
        params.require(:item).permit(:name, :amount_in_stock, :price)
    end


end
