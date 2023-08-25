FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    phone_number { '09012345679' }
    building_name { '柳ビル103' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end
