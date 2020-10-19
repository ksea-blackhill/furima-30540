  # テーブル設計
  
  ## usersテーブル

| Column     | Type    | Options       |
| ---------- | ------- | ------------- |
| name       | string  | null : false  |
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
| name          | text       | null : false  |
| description   | text       | null : false  |
| category_id   | string     | null : false  |
| status_id     | string     | null : false  |
| cost_id       | string     | null : false  |
| area_id       | string     | null : false  |
| day_id        | string     | null : false  |
| price         | string     | null : false  |
| user          | references |               |

  ### Association

  - belongs_to        :user
  - belongs_to        :payment
  - has_one_attached  :image


  ## paymentsテーブル

| Column               | Type    | Options       |
| -------------------- | ---------- | ---------- |
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



