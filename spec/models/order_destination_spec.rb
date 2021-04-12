require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_destination.postal_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @order_destination.name = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Postal code はハイフンが必要です')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @order_destination.prefecture_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @order_destination.prefecture_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと保存できないこと' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_destination.address = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_destination.phone_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @order_destination.phone_number = '090-1234-567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number は11桁以内でハイフンが不要です')
    end
    it 'phone_numberが11桁を超えると保存できないこと' do
      @order_destination.phone_number = '090123456789'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number は11桁以内でハイフンが不要です')
    end
end
