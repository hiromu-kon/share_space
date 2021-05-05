# docker_dev

![開発環境](https://user-images.githubusercontent.com/74192993/117123929-a18c5c80-add2-11eb-9870-ab6bf7ecbe4d.png)

* docker images

   * app-rails
      * ruby:2.7.2 (nginx,unicorn,supervisor)
   * mysql-57  
      * mysql:5.7


* git clone or fork


```
mkdir -p ~/git/github
cd ~/git/github
git clone git@github.com:hiromu-kon/share_space.git
```


* add localhost /etc/hosts


```
sudo vim /etc/hosts
127.0.0.1 dev.share_space.work
```

* docker run

```
cd share_space
cp .env.example .env
cd docker/dev
docker-compose up -d
```

* app deploy


```
docker exec -it app-rails bash

bundle install
rails db:migrate
/usr/bin/supervisorctl restart app
```


http://dev.share_space.work/


* DB login


```
docker exec -it app-rails bash
mysql -u root -h db -p
```
