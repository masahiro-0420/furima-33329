# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| --------            | ------  | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false, unique:true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                | Type          | Options     |
| --------              | ------        | ----------- |
| item_name             | string        | null: false |
| explain               | text          | null: false |
| category_id           | integer       | null: false |
| status_id             | integer       | null: false |
| shipping_fee_id       | integer       | null: false |
| prefecture_id         | integer       | null: false |
| delivery_schedule_id  | integer       | null: false |
| price                 | integer       | null: false |
| user                  | references    |             |


### Association

- belong_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type       | Options     |
| ------           | ---------- | ----------- |
| item             | references |             |
| user             | references |             |

### Association
- belong_to :user
- belong_to :item

## destinations テーブル

| Column           | Type       | Options     |
| ------           | ---------- | ----------- |
| postal_code      | integer    | null: false |
| prefecture       | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| phone_number     | integer    | null: false |
| purchase         | references |             |