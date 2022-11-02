# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false   unique: true|
| encrypted_password | string              | null: false               |
|  introduction      | text                | null: false                          |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items dependent: :destroy
- belongs_to :shippings dependent: :destroy
- belongs_to :wallets dependent: :destroy



## items table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|   name      |  string    | null:false                     | 
|   price     |  string    | null: false                    |
| description |  string    | null: false                    |
|  status     |  string    | null: false                    |
|  size       |  string    | null: false                    |
|shipping_cost| string     | null: false                    |
|shipping_days| string     | null: false                    |
|shipping_id  | string     | null: false                    |
|   user_id   | integer    | null: false, foreign_key: true |                  |
| category_id | integer    | null: false, foreign_key: true |
|  brand_id   | integer    | null: false, foreign_key: true |
| shipping_id | integer    | null: false, foreign_key: true |



### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy


## wallets table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user_id    | references | null: false, foreign_key: true|

### Association

- belongs_to :user


## shippings table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user_id    | integer    | null: false, foreign_key: true |
| family_name | string     | null: false                    |
| first_name  | string     | null: false                    |
|family_name_kana| string  | null: false                    |
|first_name_kana| string   | null: false                    |
|  post_code  | string     | null: false                    |
|  prefecture | string     | null: false                    |
|  city       | string     | null: false                    |
| address     | string     | null: false                    |
|building_name| string     | null: false                    |
|  phone      | string     | null: false                    |

### Association

- belongs_to :user

## brands table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|   name      | string     | index: true                    |

### Association

* has_many :item


## categories table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  name       | string     | null: false                    |


### Association

* has_many : items
