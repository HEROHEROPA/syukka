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


## アプリケーション名<br>
---
syukka<br>
<br>
## アプリケーション概要<br>
---
出荷品が画像でわかる様な簡単な出荷指示アプリを作成しました。 <br>

## URL<br>
---
https://syukka.onrender.com
<br>
<br>
<br>
## 利用方法<br>
---
### 出荷指示機能<br>
---
*商品名（３種類）と数量を入力フォームに入力します。(①pod-r,②pod-l,③pods）<br>
*注文ボタンを押すと在庫管理ページに遷移し注文受け入れボタンを押して注文確定<br> 
*出荷指示ボタンを押すと出荷指示ページへ遷移します。<br>
*注文した商品のリンクを押すと出荷品が画像で表示されます。 
### 入庫機能<br>
---
*在庫管理ページで入庫処理ボタンを押すと入庫フォームが現れます。<br>
*商品名（３種類）と数量を入力フォームに入力後入庫確認ボタンを押します。<br>
*在庫数量が更新されます。
<br>
<br>
 ### アプリケーションを作成した背景<br>
 ---
 倉庫作業業務を担当していた時に思った工数削減案
<br>
<br>
## 洗い出した要件<br>
---
https://docs.google.com/spreadsheets/d/1_ILAm7MFxtd3L0V1_S75sjZNSBLFFL6vPYoe7E_yuUY/edit?usp=sharing
<br>
<br>
## データベース設計<br>
---
![](app/assets/images/database.png)
<br>
<br>
<br>
## 開発環境<br>
---
<br>
*フロントエンド<br>
*バックエンド<br>
*インフラ<br>
*テキストエディタ<br>
<br>

## ローカル環境での動作<br>
---
<br>
% git clone https://github.com/HEROHEROPA/syukka.git<br>
% cd syukka.git<br>
% bundle install<br>
% yarn install<br>

<br>
<br>

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

<br>


## アプリケーション概要 <br>
出荷品が画像でわかる様な簡単な出荷指示アプリを作成しました。<br> 
● 接続先情報 <br>
■ https://syukka.onrender.com<br>
● Githubリポジトリ <br>
■ https://github.com/HEROHEROPA/syukka <br>
● 開発環境 <br>
○ Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/JavaScript <br>
● 開発期間と平均作業時間 <br>
○ 開発期間：5/25〜7/14現在(実働12日間) <br>
○ 1日あたりの平均作業時間：6時間<br>
○ 合計：72時間 <br>
