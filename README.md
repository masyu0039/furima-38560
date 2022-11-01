# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false   unique: true|
| password           | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| year               | string              | null: false               |
| month              | string              | null: false               |
| day                | string              | null: false               |
### Association

* has_many :buyers
* has_many :items
* has_many :comments 
* has_many :messages 
* has_many :wallets  
* has_many :reviews  
* has_many :orders   


## buyers table

| Column             | Type           | Options                        |
|--------------------|----------------|--------------------------------|
| user_id            | references     | null: false, foreign_key: true |
| buyer              | string         | null: false                    |

### Association

- belongs_to :user

## items table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| category_id | references | null: false, foreign_key: true |
| shipping    | references | null: false, foreign_key: true |
| brand_id    | references | null: false, foreign_key: true |
| nickname    | string     | null: false                    |
| text        | text       | null: false,                   |
| condition   | integer    | null: false                    |
| price       | integer    | null: false                    |


### Association

- belongs_to :users
- belongs_to :category
- belongs_to :brands
- has_many   :comments
* has_one    :shipping



## messages table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| text        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## item-img table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item_id     | references | null: false, foreign_key: true |
| url         | string     | null: false                    |

### Association

- belongs_to :item

## wallets table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| money       | integer    | null: false                    |

### Association

- belongs_to :user

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| text        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## reviews table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| rate        | integer    | null: false                    |
| text        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|buyer_user_id| references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shippings table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  post code  | references | null: false, foreign_key: true |
|  region     | integer    | null: false                    |
|handling_time| integer    | null: false                    |

### Association

- belongs_to :item

## brands table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  category_id| references | null: false, foreign_key: true |
|  brand_id   | references | null: false, foreign_key: true |
|  name       | string     | null: false                    |

### Association

* has_many :item
- belongs_to :category


## categories table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|  path       |   text     | null: false                    |
|  name       | string     | null: false                    |
|handling_time| integer    | null: false                    |

### Association

* has_many :brands
* has_many :items