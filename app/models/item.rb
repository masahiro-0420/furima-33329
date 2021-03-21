class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do

    validates :item_name
    validates :explain
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_schedule_id 
    validates :price, :numericality => {
      :greater_than_or_equal_to => 300,
      :less_than_or_equal_to => 9999999,
      :message => '入力値が300~9,999,999の範囲外です' 
    }, format: {with: /\A[0-9]+\z/, message: 'は半角数字以外では登録できません'}
    validates :image

  end
end
