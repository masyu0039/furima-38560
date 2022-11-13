require 'rails_helper'

RSpec.describe CredentialForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @credential_form = FactoryBot.build(:credential_form, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@credential_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @credential_form.user_id = 1
        expect(@credential_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @credential_form.item_id = 1
        expect(@credential_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @credential_form.postal_code = '123-4560'
        expect(@credential_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @credential_form.prefecture_id = 1
        expect(@credential_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @credential_form.city = '横浜市'
        expect(@credential_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @credential_form.address = '旭区１２３'
        expect(@credential_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @credential_form.building_name = nil
        expect(@credential_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @credential_form.phone = 12_345_678_910
        expect(@credential_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @credential_form.user_id = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @credential_form.item_id = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @credential_form.postal_code = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @credential_form.postal_code = 1_234_567
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @credential_form.prefecture_id = 0
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @credential_form.prefecture_id = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @credential_form.city = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @credential_form.address = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @credential_form.phone = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @credential_form.phone = '123 - 1234 - 1234'
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @credential_form.phone = 12_345_678_910_123_111
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が9桁以下であると保存できないこと' do
        @credential_form.phone = 12_345_678_9
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include('Phone is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @credential_form.token = nil
        @credential_form.valid?
        expect(@credential_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end