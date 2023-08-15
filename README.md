# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first         | string | null: false               |
| kana_last          | string | null: false               |
| birthdate          | date   | null: false               |

### Association
- has_many :items dependent: :destroy
- has_many :orders

## items テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| image              | string  | null: false               |
| name               | string  | null: false               |
| description        | string  | null: false               |
| category           | integer | null: false               |
| condition          | integer | null: false               |
| shipping_fee       | integer | null: false               |
| shipping_region    | integer | null: false               |
| shipping_duration  | integer | null: false               |
| price              | integer | null: false               |

### Association
- belongs_to :user
- belongs_to :order

## orders テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| credit_card_number | integer | null: false               |
| expiration_date    | integer | null: false               |
| security_code      | string  | null: false               |

### Association
- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| postal_code        | string  | null: false               |
| prefecture         | integer | null: false               |
| city               | string  | null: false               |
| street_address     | string  | null: false               |
| building_name      | string  |                           |
| phone_number       | string  | null: false               |


### Association
- has_many :items
- has_one :order

