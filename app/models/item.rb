class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, :category, :condition, :shipping_fee, :shipping_duration
  
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :name,                   presence: true
  validates :description,            presence: true
  validates :category_id,            presence: true
  validates :condition_id,           presence: true
  validates :prefecture_id,          presence: true
  validates :shipping_fee_id,        presence: true
  validates :shipping_duration_id,   presence: true
  validates :price,                  presence: true
end
