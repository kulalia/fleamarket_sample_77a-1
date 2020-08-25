# README


### DB設計

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|category_id(active_hash)|integer|null: false|
|detail|string|null: false|
|brand|string||
|price|integer|null: false|
|item_status|string|null: false|
|prefecture_id(active_hash)|integer|null: false|
|days_until_shipping|integer|null: false|
|shipping_fee|string|null: false|
|sale_or_sold|string|null: false|


### Association
- has_many :images, dependent: :destroy
- belongs_to :user
- has_one :purchase_history, dependent: :destroy


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belongs_to :item


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :delivery_addresses, dependent: :destroy
- has_many :purchase_histories, dependent: :destroy
- has_one :user_profile, dependent: :destroy



## user_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|

### Association
- belongs_to :user



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id(token)|string|null: false|
|card_id(token)|string|null: false|

### Association
- belongs_to :user


## delivery_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone_number|string|


### Association
- belongs_to :user



## item_purchase_histories

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|

### Association
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :item