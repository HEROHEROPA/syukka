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


## orders テーブル

｜Column                | Type     |  Options                 |
｜----------------------| -------  |  ----------------------  | 
｜order_number          | string   |  null: false             |       
｜order_amount          | integer  |  null: false             |


### Association

- has_one :shipping




## stocks テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -----------------------------    |
｜item_number           | string        |  null: false                      |
｜stock_amount          | integer       |  null: false                      |
｜item_image            | text          |  null: false                      |
｜confirm_point         | text          |                                   |



### Association
- has_many :to_stocks



## shippings テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -------------------------------- |
｜order                 | references    |  null: false ,foreign_key: true   |
｜config_id             | integer       |  null: false                      |




### Association

- belongs_to :order



## to_stocks テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -------------------------------- |
｜stock                 | references    |  null: false ,foreign_key: true   |
｜to_stock_amount       | integer       |  null: false                      |



### Association

-belongs_to :stock
