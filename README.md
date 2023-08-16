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
- has_many :items 
- has_many :orders

## items テーブル
| Column               | Type      | Options                        |
| -------------------- | ------- | -------------------------------- |
| user                 | references| null: false, foreign_key: true |
| name                 | string  | null: false                      |
| description          | text    | null: false                      |
| category_id          | integer | null: false                      |
| condition_id         | integer | null: false                      |
| shipping_fee_id      | integer | null: false                      |
| prefecture_id        | integer | null: false                      |
| shipping_duration_id | integer | null: false                      |
| price                | integer | null: false                      |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |


### Association
- belongs_to :order

