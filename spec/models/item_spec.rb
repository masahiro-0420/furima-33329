require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do

    it 'nameの値が存在すれば登録できること' do

    end

    it 'nameが空では登録できないこと' do

    end



  end
end
