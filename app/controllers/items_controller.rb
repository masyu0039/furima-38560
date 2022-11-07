class ItemsController < ApplicationController
    # ログインしていないユーザーはログインページに促す
    #before_action :authenticate_user!, except: [:index, :show]
  
    # 重複処理をまとめる
    #before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    #def index

    #end
  
    #def new
     # @item = Item.new
   # end
  
    #def create
      #@item = Item.new(item_params)
      #if @item.save
        #redirect_to root_path
      #else
        #render :new
      #end
    #end
    #private

    #def item_params
      #params.require(:item).permit( :nickname, :price, :description, :status_id, :prefecture_id, :size_id, :postage_id, :shipping_date_id).merge(user_id: current_user.id)
    #end
  
    #def set_item
      #@item = Item.find(params[:id])
    #end
  #end