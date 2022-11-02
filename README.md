# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false   unique: true|
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

- belongs_to : user
- has_many : comments
- has_many : messages
- has_many : likes
- has_many : items
- has_one: order
- belongs_to : brand
- belongs_to : categories



## items table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|   name      |  string    | null:false                     | 
|   price     |  integer   | null: false                    |
| description |  string    | null: false                    |
|  status     |  string    | null: false                    |
|  prefecture |  integer   | null: false                    |
|   size      |  string    | null: false                    |
|   postage   | string     | null: false                    |
|shipping_date| string     | null: false                    |
|  brand      | references | null: false, foreign_key: true |
|buyer_id     | integer    |                                |
|reservation_email| string |                                |
|   user_id   | references | index:true, foreign_key: true  |


### Association

- belongs_to : user
- has_many : comments
- has_many : likes
- belongs_to : categories


## card table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user_id    | references | null: false, foreign_key: true |
|card_company | string     | null: false                    |
|card_number  | string     | null: false                    |
|card_year    | integer    | null: false                    |
|card_month   | integer    | null: false                    |
|card_pass    | integer    | null: false                    |
|customer_id  | string     |                                |
|  card_id    | string     | null: false                    |

### Association

- belongs_to :user


## shippings table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user_id    | integer    | null: false, foreign_key: true |
|  postal_code| string     | null: false                    |
|  prefecture | string     | null: false                    |
|  city       | string     | null: false                    |
| address     | string     | null: false                    |
|building_name| string     |                                |
|  phone      | string     | null: false                    |


### Association

- belongs_to : user

## credential table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  provider   | string     | null: false                    |
|  uid        | string     | null: false                    |
|  user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to : user

## comments table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  comment    | text       | null: false                    |
|  user       | references | null: false, foreign_key: true |
|  user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : items

## categories table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  name       | string     | null: false                    |
|  ancestry   | string     |                                |


### Association

- has_many : items

## likes table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user_id    |references  | null: false, foreign_key: true |
|  items_id   |references  | null: false, foreign_key: true |


### Association

-belongs_to : user
-belongs_to : product