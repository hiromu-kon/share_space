# SHARE SPACE

オフィスの空きスペースを利用して、自社で足りないスキルを他者にオンサイトで依頼できるオフィス常駐専用マッチングサービスです。<br>
｢スペースを提供しオンサイトで仕事を依頼したい企業｣と｢スキルを提供したい企業｣をつなぎ、企業間でコミュニケーションをとることができます！

![トップページ](https://user-images.githubusercontent.com/74192993/116544187-c3e12e80-a929-11eb-96c2-c4bf9513005c.jpeg)

<br>

# 🌐 URL
https://www.share-space.work/

* 常時SSL化 (AWS ACM, Route53, ALB)
* トップページ内にゲストログインボタンを配置しております。

<br>

# ⚙️ 使用技術
* フロントエンド
  * HTML/CSS
  * SCSS
  * Javascript
* バックエンド
  * Ruby:2.7.2
  * Rails:6.1.3
* インフラ・本番環境  
  * AWS(VPC, Route53, ALB, EC2, RDS, S3, ACM)
  * CircleCI(CD)
  * Nginx
  * Unicorn
* 開発環境
  * appコンテナ（nginx,ruby,unicorn,supervisor）
  * mysqlコンテナ(mysql5.7)
    * nginx(webサーバー)とunicorn(アプリの起動)はsupervisorで起動

  <br>

  (開発環境のREADME)  
  https://github.com/hiromu-kon/share_space/blob/master/docker/dev/app/README.md

* テスト・静的コード解析
  * Rspec
  * Rubocop

<br>

# 📚 機能一覧
* ユーザー機能
* 管理者機能
* 投稿機能
  * タグ付け機能
  * 検索機能（フリーワード検索機能、タグ検索機能）
  * ソート機能
* ブックマーク機能
* CSV出力機能(ブックマーク)
* コメント機能
* ダイレクトメッセージ機能
* 通知機能
* 商談予約機能

<br>

# 💡 こだわった点
* 直感的に動かせるUI/UX
BtoBのマッチングサイトのため、誰が使ってもわかりやすく使い続けやすいようにデザインを工夫しました。
レスポンシブ対応もしているので、スマホからでも手軽に利用できるようになっております。

* Simple Calendarによる商談予約機能の実装
* 投稿機能において外部APIを使用（Google Maps API, Geocoding API）

<br>

# 👀 SHARE SPACEの開発背景
私の現職が営業会社でして、営業が苦手なクライアント先に常駐をしてコールセンター等で営業を手助けするという仕事をしております。
私がクライアント先で働いている中で思うことはどの企業にも得手不得手があり、社内の実力・メンバーではどうしても補えない部分があるということです。
逆に実力があるがその力を有効活用できていない企業も多くあると思います。
その企業同士をマッチングさせることによって今まで繋がるはずのなかった企業を結び合わせ、Win Winの関係でどちらも売り上げを上げることができます。

現在コロナ禍の情勢において、新しくオフィスを契約することも金銭面等でできない企業も少なくないです。そこで空きスペースを利用することにより,
今までにはなかったオフィスのありかたが誕生するのではないかと思い、オフィスの隙間を利用したオンサイト専用マッチングサイトを作成しました。

<br>

# 🔧 インフラ構成図

<img width="834" alt="インフラ構成図" src="https://user-images.githubusercontent.com/74192993/117576357-ab8ac400-b120-11eb-9e93-517963f99a49.png">

<br>

# 📝 ER図
![ER図](https://user-images.githubusercontent.com/74192993/117969651-a87f1600-b362-11eb-9a38-32747fa4d933.png)
