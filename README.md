  # テーブル設計
  
  ## usersテーブル

| Column     | Type    | Options       |
| ---------- | ------- | ------------- |
| first_name | string  | null : false  |
| last_name  | string  | null : false  |
| kana_first | string  | null : false  |
| kana_last  | string  | null : false  |
| email      | string  | null : false  |
| password   | string  | null : false  |
| nickname   | string  | null : false  |
| birthday   | date    | null : false  |

  ### Association

  - has_many  :items
  - has_many  :payments


  ## itemsテーブル

| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| name          | string     | null : false     |
| description   | text       | null : false     |
| category_id   | integer    | null : false     |
| status_id     | integer    | null : false     |
| cost_id       | integer    | null : false     |
| area_id       | integer    | null : false     |
| day_id        | integer    | null : false     |
| price         | integer    | null : false     |
| user          | references | foreign_key :true|

  ### Association

  - belongs_to        :user
  - belongs_to        :payment
  - has_one_attached  :image


  ## paymentsテーブル

| Column               | Type       | Options          |
| -------------------- | ---------- | ---------------- |
| user                 | references | foreign_key :true|
| item                 | references | foreign_key :true|

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one    :address


  ## addressテーブル

| Column               | Type       | Options          |
| -------------------- | ---------- | -----------------|
| postal_code          | string     | null : false     |
| prefecture_id        | integer    | null : false     |
| municipality         | string     | null : false     |
| banchi               | string     | null : false     |
| building             | string     |                  |
| tel                  | string     | null : false     |
| payment              | references | foreign_key :true|

  ### Association

  belongs_to   :payment



