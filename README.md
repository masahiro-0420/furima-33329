# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_date      | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type          | Options     |
| --------           | ------        | ----------- |
| item_name          | string        | null: false |
| explain            | text          | null: false |
| category           | integer       | null: false |
| status             | integer       | null: false |
| shipping_fee       | integer       | null: false |
| prefecture         | integer       | null: false |
| delivery_schedule  | integer       | null: false |
| price              | integer       | null: false |
| user_id            | references    |             |


### Association

- belong_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type       | Options     |
| ------           | ---------- | ----------- |
| card_number      | integer    | null: false |
| expire_month     | integer    | null: false |
| expire_year      | integer    | null: false |
| cvc              | integer    | null: false |
| postal_code      | integer    | null: false |
| prefecture       | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| phone_number     | integer    | null: false |
| item_id          | references |             |
| user_id          | references |             |

### Association

- belong_to :user
- belong_to :item