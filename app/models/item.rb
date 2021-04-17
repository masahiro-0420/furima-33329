class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_schedule

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do

    validates :item_name
    validates :explain

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id 
      validates :prefecture_id
      validates :delivery_schedule_id
    end

    validates :price, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999,
      message: '入力値が300~9,999,999の範囲外です' 
    }, format: {with: /\A[0-9]+\z/, message: 'は半角数字以外では登録できません'}
    
    validates :image

  end
end
