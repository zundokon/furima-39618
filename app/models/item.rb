class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_duration

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_fee_id
    validates :shipping_duration_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, presence: {message: "can't be blank"}
  end
  
  validates :name,                  presence: true
  validates :description,           presence: true
  validates :image,                 presence: true
end
