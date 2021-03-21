class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do

    validates :item_name
    validates :explain
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_schedule_id 
    validates :price
    validates :image

  end
end
