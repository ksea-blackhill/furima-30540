  # テーブル設計
  
  ## usersテーブル

| Column     | Type    | Options       |
| ---------- | ------- | ------------- |
| user_name  | string  | null : false  |
| email      | string  | null : false  |
| password   | string  | null : false  |
| nickname   | string  | null : false  |
| birthday   | string  | null : false  |

  ### Association

  - has_many :items
  - has_one  :payment


  ## itemsテーブル

| Column        | Type       | Options       |
| ------------- | ---------- | --------------|
| image         |            |               |
| item_name     | text       | null : false  |
| description   | text       | null : false  |
| item_category | string     | null : false  |
| item_status   | string     | null : false  |
| shipping_cost | string     | null : false  |
| shipping_area | string     | null : false  |
| shipping_day  | string     | null : false  |
| item_price    | string     | null : false  |
| user          | references |               |

  ### Association

  - belongs_to        :user
  - has_one           :payment
  - has_one_attached  :image


  ## paymentsテーブル

| Column               | Type    | Options       |
| -------------------- | ---------- | ---------- |
| credit_info          |            |            |
| credit_period        |            |            |
| security_code        |            |            |
| user                 | references |            |
| item                 | references |            |

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one    :address


  ## addressテーブル

| Column               | Type       | Options       |
| -------------------- | ---------- | --------------|
| postal_code          | string     | null : false  |
| prefecture           | string     | null : false  |
| municipality         | string     | null : false  |
| banchi               | string     | null : false  |
| building             | string     | null : false  |
| tel                  | string     | null : false  |
| payment              | references |               |

  ### Association

  belongs_to   :payment



