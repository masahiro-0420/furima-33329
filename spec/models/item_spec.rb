require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do

    it 'item_name, explain, category_id, status_id, shipping_fee_id, prefecture_id, delivery_schedule_id, price, user の値が存在すれば登録できること' do
      expect(@item).to be_valid
    end
    it 'item_nameが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空では登録できないこと' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'explainが空では登録できないこと' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it 'category_idが1では登録できないこと' do
      @item.scategory_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'status_idが1では登録できないこと' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'shipping_fee_idが1では登録できないこと' do
      @item.shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end
    it 'prefecture_idが1では登録できないこと' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'delivery_schedule_idが1では登録できないこと' do
      @item.delivery_schedule_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery schedule must be other than 1")
    end
    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end   
    it 'priceが299では登録できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9,999,999の範囲外です")
    end   
    it 'priceが10000000では登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 入力値が300~9,999,999の範囲外です")
    end   
  end
end
