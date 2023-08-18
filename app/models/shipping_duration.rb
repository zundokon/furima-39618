class Shipping_duration < ActiveHash::Base
  self.data = [
    { id: 1, shipping_duration_id: '--' },
    { id: 2, shipping_duration_id: '1~2日で発送' },
    { id: 3, shipping_duration_id: '2~3日で発送' }
    { id: 4, shipping_duration_id: '4~7日で発送' }
  ]
   include ActiveHash::Associations
   has_many :items
  end