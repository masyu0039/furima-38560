class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  
  has_one :credential
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :status_id
    validates :prefecture_id
    validates :category_id 
    validates :postage_id
    validates :shipping_date_id   
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :status_id
    validates :prefecture_id
    validates :category_id
    validates :postage_id
    validates :shipping_date_id
  end
end
