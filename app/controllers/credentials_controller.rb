class CredentialsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @credential_form = CredentialForm.new
  end

  def create
    @credential_form = CredentialForm.new(credential_params)
    if @credential_form.valid?
      pay_item
      @credential_form.save
      redirect_to root_path
    else
      render :index
    end
  end

private

def credential_params
  params.require(:credential_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,        # 商品の値段
    card: credential_params[:token], # カードトークン
    currency: 'jpy'             # 通貨の種類（日本円）
  )
end

def non_purchased_item
  @item = Item.find(params[:item_id])
  redirect_to root_path if current_user.id == @item.user_id || @item.credential.present?
  end
end
