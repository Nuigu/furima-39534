# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Usersテーブル
|Column            |Type      |Options                  |
|------------------|----------|-------------------------|
|nickname          |string    |null: false              |
|email             |string    |null: false, unique: true|
|encrypted_password|string    |null: false              |
|last_name         |string    |null: false              |
|first_name        |string    |null: false              |
|last_name_kana    |string    |null: false              |
|first_name_kana   |string    |null: false              |
|birthday_year     |integer   |null: false              |
|birthday_month    |integer   |null: false              |
|birthday_day      |integer   |null: false              |


## Associations
has_many :items

# Itemsテーブル
|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|name              |string    |null: false                   |
|detail            |text      |null: false                   |
|price             |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|
|category          |references|null: false, foreign_key: true|
|quality           |references|null: false, foreign_key: true|
|delivery_cost     |references|null: false, foreign_key: true|
|prefecture        |references|null: false, foreign_key: true|
|delivery_time     |references|null: false, foreign_key: true|


## Associations
belongs_to :user
belongs_to :quality
belongs_to :delivery_cost
belongs_to :prefecture
belongs_to :delivery_time
has_one :order

# Ordersテーブル
|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|postal_code       |string    |null: false                   |
|city              |string    |null: false                   |
|address           |string    |null: false                   |
|building          |string    |                              |
|phone_number      |string    |null: false                   |
|item              |references|null: false, foreign_key: true|
|prefecture        |references|null: false, foreign_key: true|

## Associations
belongs_to :item
belongs_to :prefecture
