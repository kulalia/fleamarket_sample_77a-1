# README


### DB設計

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|category|integer|null: false|
|image|string|null: false|
|detail|string|null: false|
|bland|string||
|plice|integer|null: false|
|item_status|string|null: false|
|shipping_region|string|null: false|
|days_until_shipping|integer|null: false|
|shipping_fee|string|null: false|
|sale_or_sold|string|null: false|


### Association
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|mail_address|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items
- has_many :cards
- has_many :delivery_addresses

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|name|string|null: false|
|effective_date|datetime|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## delivery_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string| |
|phone_number|integer||
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user