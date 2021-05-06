# SHARE SPACE

オフィスの空きスペースを利用して、自社で足りないスキルを他者にオンサイトで依頼できるオフィス常駐専用マッチングサービスです。<br>
｢スペースを提供しオンサイトで仕事を依頼したい企業｣と｢スキルを提供したい企業｣をつなぎ、企業間でコミュニケーションをとることができます！

![トップページ](https://user-images.githubusercontent.com/74192993/116544187-c3e12e80-a929-11eb-96c2-c4bf9513005c.jpeg)


# 🌐 URL
https://www.share-space.work/

* 常時SSL化 (AWS ACM, Route53, ALB)
* トップページ内にゲストログインボタンを配置しております。


# ⚙️ 使用技術
* フロントエンド
  * HTML/CSS
  * SCSS
  * Javascript 
* バックエンド
  * Ruby:2.7.2
  * Rails:6.1.3
* インフラ・開発環境  
  * AWS(VPC, Route53, ALB, EC2, RDS, S3, ACM)
  * CircleCI(CI/CD)
  * Docker/docker-compose
  * MySQL
  * Nginx
  * Unicorn
  * supervisor
* テスト・静的コード解析
  * Rspec
  * Rubocop

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


# 💡 こだわった点
* 直感的に動かせるUI/UX


* Simple Calendarによる商談予約機能の実装
* 投稿機能において外部APIを使用（Google Maps API, Geocoding API）

# 👀 SHARE SPACEの開発背景
私の現職が営業会社でして、営業が苦手なクライアント先に常駐をしてコールセンター等で営業を手助けするという仕事をしております。
私がクライアント先で働いている中で思うことはどの企業にも得手不得手があり、社内の実力・メンバーではどうしても補えない部分があるということです。
逆に実力があるがその力を有効活用できていない企業も多くあると思います。
その企業同士をマッチングさせることによって今まで繋がるはずのなかった企業を結び合わせ、Win Winの関係でどちらも売り上げを上げることができます。

現在コロナ禍の情勢において、新しくオフィスを契約することも金銭面等でできない企業も少なくないです。そこで空きスペースを利用することにより,
今までにはなかったオフィスのありかたが誕生するのではないかと思い、オフィスの隙間を利用したオンサイト専用マッチングサイトを作成しました。

# 🔧 インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/74192993/117253920-c6400d00-ae82-11eb-8a3a-b95223719ba7.png)

# 📝 ER図
