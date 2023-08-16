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
| Column               | Type    | Options                        |
| -------------------- | ------- | ------------------------------ |
| image                | string  |                                |
| name                 | string  | null: false                    |
| description          | string  | null: false                    |
| category_id          | integer | null: false                    |
| condition_id         | integer | null: false                    |
| shipping_fee_id      | integer | null: false, foreign_key: true |
| shipping_region_id   | integer | null: false, foreign_key: true |
| shipping_duration_id | integer | null: false, foreign_key: true |
| price                | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders, dependent: :destroy

## orders テーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| user_id            | integer | null: false, foreign_key: true |
| item_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| postal_code        | string  | null: false                    |
| prefecture_id      | integer | null: false, foreign_key: true |
| city               | string  | null: false, foreign_key: true |
| street_address     | string  | null: false, foreign_key: true |
| building_name      | string  | foreign_key: true              |
| phone_number       | string  | null: false, foreign_key: true |


### Association
- belongs_to :order

