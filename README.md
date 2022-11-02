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

- has_many : comments
- has_many : messages
- has_many : likes
- has_many : items
- has_many : orders
- belongs_to : brand
- belongs_to : category



## items table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|   name      |  string    | null:false                     | 
|   price     |  integer   | null: false                    |
| description |  text      | null: false                    |
|  status     |  string    | null: false                    |
|prefecture_id|  integer   | null: false                    |
|   size      |  string    | null: false                    |
|   postage   | string     | null: false                    |
|shipping_date| string     | null: false                    |
|   user      | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- has_many : comments
- has_many : likes
- has_one  : order





## shippings table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|credential   | references | null: false, foreign_key: true |
|  postal_code| string     | null: false                    |
|prefecture_id| integer    | null: false                    |
|  city       | string     | null: false                    |
| address     | string     | null: false                    |
|building_name| string     |                                |
|  phone      | string     | null: false                    |


### Association

- belongs_to : credential

## credentials table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user       | references | null: false, foreign_key: true |
|  item       | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : items
* has_one : shippings

## comments table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  comment    | text       | null: false                    |
|  user       | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : items


### Association

- has_many : items

## likes table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  user       |references  | null: false, foreign_key: true |
|  items      |references  | null: false, foreign_key: true |


### Association

-belongs_to : user
-belongs_to : product