# :paw_prints: README


## :computer: アプリ名
### FURIMA


## :globe_with_meridians: URL
http://54.250.71.53/<br>
■ Basic認証<br>
ID：admin<br>
Pass：2222<br><br>

## :balloon: トップページ
  ![54 250 71 53_(iPad)](https://user-images.githubusercontent.com/62837444/90970173-4fedbb80-e53c-11ea-817f-e8c7bcf134d1.png)
  

## :bulb: 制作背景
家にある使っていない物が、誰かにとって必要な物かもしれません。<br>
シンプルで使いやすいフリマアプリがあれば気軽始めることができ、必要な人の元へお届けしやすいのではと考えて制作しました。

## :beginner: 説明
  フリマーケットサイトの模擬サイトです。
  実際に販売等はできませんが、以下の機能を動かすことができます。
  - ユーザー登録・ログイン
  - 商品出品
  - 出品した商品情報の編集
  - 出品した商品の削除
  - 商品の詳細情報の確認
  - 商品の購入
  - クレジットカードの登録

## :star2: 使い方
  - トップページ・商品詳細ページの閲覧のみであればログインは不要です
  - 出品・編集・削除はログインが必要です
  - 購入はログインとクレジットカード登録が必要です
  
## :lock: 閲覧用 
■ テスト用アカウント<br>
◯ 購入者用<br>
メールアドレス：kounyu@gmail.com<br>
パスワード：aaaaaaa<br><br>

◯ 購入用カード情報<br>
番号：4242424242424242<br>
期限：01/23<br>
セキュリティコード：222<br><br>

◯ 出品者用<br>
メールアドレス：a@a<br>
パスワード：aaaaaaa<br><br>

## :black_nib: 構築
  $ git clone https://github.com/yuri2509/fleamarket_sample_72a.git<br>
  $ cd fleamarket_sample_72a<br>
  $ bundle install<br>
  $ rails db:create<br>
  $ rails db:migrate<br>
  $ rails s<br>
  http://localhost:3000

## :warning: ライセンス
MIT


## :pushpin: DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_reading|string|null: false|
|first_name_reading|string|null: false|
|birth_day|integer|null: false|

### Association
- has_one :card
- has_many :items
- has_one :destination
- has_many :purchases


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|trading_status|integer|null: false|
|description|text|null: false|
|status|integer|null: false|
|brand|text||
|cost|integer|null: false|
|day|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### prefecturenについて
active_hashのgemを使う


### Association
- belongs_to :user
- has_many :images
- belongs_to :category
- has_many :purchases

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, unique: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

### payjpについて
カード情報の暗号化にこのgemを使う

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_reading|string|null: false|
|first_name_reading|string|null: false|
|post_code|integer|null: false|
|prefecture|ineteger|null: false|
|city|string|null: false|
|adress|string|null: false|
|building_name|string||
|phone_number|integer|null: false, unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items
has_ancestry

### ancestryについて
ancestryのgemを使う

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

