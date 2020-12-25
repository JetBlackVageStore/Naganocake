# NAGANO CAKE
 長野県にあるケーキ屋さんで徐々に人気がでてきて、
 店舗だけでは対応しきれなくなってきてたところで依頼を頂き、
 さらなる生産性を目指して会員制のケーキ購入用ECサイトを作成しました。
# 実装機能
- user
  - 会員登録・プロフィール編集・退会
  - 商品の閲覧・カートの管理・注文・他者への注文
  - ジャンル検索
- admin
  - ジャンル登録・編集・削除
  - 商品の登録・編集・削除
  - 注文履歴の確認
  - 販売・会員・注文・制作ステータス変更
  - 会員情報の確認・編集
# 開発環境
- Ruby 2.6.3
- Rails 5.2.4.4
- SQlite3
- Gems
  - bootstrap-sass
  - jquery-rails
  - kaminari
  - devies
  - cancancan
  - rolify
  - refile-mini_magick
# インストール
  ```
  $ git clone git@github.com:JetBlackVageStore/Naganocake.git
  $ cd Naganocake
  $ rails db:seed
  $ rails db:migrate
  ```
#ログイン方法
最初のadmin側ログインは
メールアドレス：test@test
パスワード：testtest
を入力してログインしてください。
※事前に【rails db:seed】でデータを入れてから行ってください
customer側の会員登録は新規登録から行ってください。
# チーム紹介[漆黒の八百屋]
- [まっつん（松岡達哉）](https://github.com/TatsuyaMatsuoka0904)
  - admin側アイテム関係
  - admin側カスタマー関係
  - admin側ジャンル関係
  - 全体のフォロー
  - gitコンフリクト時のエラー箇所修正
- [おざ（小澤将）](https://github.com/zawasho)
  - customer側注文関連
  - customer側プロフィール作成
  - customer側届け先関連
- [オニの子（進藤聖起）](https://github.com/sindoumasaki)
  - admin側devies関連
  - admin注文関係
  - admin側のアプリケーションコントローラー関係
  - ヘッダー部分
- [たさやん（田阪友也）](https://github.com/tasayan08)
  - customer側devies関連
　- customer側アイテム関連
　- customer側カート関連