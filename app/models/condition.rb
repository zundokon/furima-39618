class Condition < ActiveHash::Base
  self.data = [
    { id: 1, condition_id: '--' },
    { id: 2, condition_id: '新品・未使用' },
    { id: 3, condition_id: '未使用に近い' },
    { id: 4, condition_id: '目立った傷や汚れなし' },
    { id: 5, condition_id: 'やや傷や汚れあり' },
    { id: 6, condition_id: '傷や汚れあり' },
    { id: 7, condition_id: '全体的に状態が悪い' },
  ]

  include ActiveHash::Associations
  has_many :items

end