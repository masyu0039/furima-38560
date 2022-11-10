class ItemsController < ApplicationController
  
    before_action :authenticate_user!, except: [:index, :show]
  
    
    # before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def index
      @items = Item.includes(:user).order('created_at DESC')
    end
  
    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end

      def show
        
      end

    end
    private

    def item_params
      params.require(:item).permit(:image, :name, :price, :description, :status_id, :prefecture_id, :category_id, :postage_id, :shipping_date_id).merge(user_id: current_user.id)
    end
  
    def set_item
      @item = Item.find(params[:id])
    end
  end