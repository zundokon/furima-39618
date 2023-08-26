require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form= FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postal_codeが空だと購入できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角ハイフンを含まなければ購入できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code 例）123-4567")
      end
      it 'postal_codeが全角だと購入できないこと' do
        @order_form.postal_code = '１２３−４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code 例）123-4567")
      end

      it 'prefecture_idが「---」だと購入できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと購入できないこと' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと購入できないこと' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが全角だと購入できないこと' do
        @order_form.phone_number = '０９０−１２３４−５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと購入できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      end
    end
  end
end
