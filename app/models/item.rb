class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, :category, :condition, :shipping_fee, :shipping_duration
  
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end
