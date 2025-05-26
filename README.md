# プロジェクト名：『推しTask』
<img width="500" src="app/assets/images/OshiTask_logo2.png"><br>
サービスURL：
<br>

# 目次
- [サービス概要](#サービス概要)
- [サービス開発の背景](#サービス開発の背景)
- [機能紹介](#機能紹介)
- [技術構成](#技術構成)
  - [使用技術](#使用技術)
  - [ER図](#er図)
  - [画面遷移図](#画面遷移図)<br>
<br>

# サービス概要
自分にとっての推しが存在する人に送る、<br>
タスク管理に加えて、進捗によって推しからのリアクションをもらえるサービスです<br>
<br>

# サービス開発の背景
私は昔から、コツコツとアイテムを収集して目標物を作り上げるタイプのゲームが好きでした。  
ゲームを進める中で、必要なアイテムや素材をメモ帳で管理していたのですが、アイテム同士が階層構造になっているため、整理が面倒になり次第にプレイの意欲を失ってしまうことがありました。
<br>
そのときに思ったのが、「もっと楽しく、モチベーションを保ちながら管理できる方法があればいいのに」ということです。  
そこで私は、“推し”の存在を活用することで、作業のモチベーションが上がるのではないかと考えました。
<br>
“推し”は見るだけで気分が上がる存在であり、ゲームだけでなく、日常のタスク管理にも応用できると感じました。  
このアイデアをもとに、タスクの進捗によって推しからのリアクションをもらえる「推しTask」を開発するに至りました。
<br>

# 機能紹介

| ユーザー登録 / ログイン |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/8e66d78a4099622bc3137110f77dceca.gif)](https://gyazo.com/8e66d78a4099622bc3137110f77dceca) |
| <p align="left">『名前』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。<br>また、Googleアカウントを用いてGoogleログインを行う事も可能です。</p> |
<br>

| 推しプロフィールの登録 |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/d4853a67085daafddcf02bc63c0de95d.gif)](https://gyazo.com/d4853a67085daafddcf02bc63c0de95d) |
| <p align="left">『マイページ』→『設定』から推しの情報を登録できます。<br>入力が終わったら『設定』を押し、プロフィールの登録が完了します。<br>（プロフィールの登録と同時にAIによるコメントが生成されるため、数分かかる場合があります。）</p> |
<br>

| タスク登録 |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/8493dc236fa96b2d2502825b52876bcb.gif)](https://gyazo.com/8493dc236fa96b2d2502825b52876bcb)|
| <p align="left">『タスク一覧』から、『作成』を押し、タスクの登録ができます。<br>タスクについてのメモも登録できます。</p> |
<br>

| 推しからの激励機能 |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/051b1f524dbe2629b47d3fa5774d1a36.gif)](https://gyazo.com/051b1f524dbe2629b47d3fa5774d1a36) |
| <p align="left">タスクが完了した際、『完了』を押すと、推しからの激励メッセージが表示されます。<br>（『未完了』、『編集』、『削除』、『サブ、サードタスク完了時』に異なるメッセージが表示されます。）</p> |
<br>

| タスク詳細 / サブタスク登録 |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/fca88977a7c9f9a1ad6db6536042d5d4.gif)](https://gyazo.com/fca88977a7c9f9a1ad6db6536042d5d4) |
| <p align="left">『タスク一覧』から各タスクをクリックして、タスクの詳細を確認できます。<br>さらに、各々のタスクにサブタスクを登録できます。</p> |
<br>

| サブタスク詳細 / サードタスク登録 |
| :---: | 
| [![Image from Gyazo](https://i.gyazo.com/02fd8b1df645816e75ee25c558d7f1fe.gif)](https://gyazo.com/02fd8b1df645816e75ee25c558d7f1fe) |
| <p align="left">『サブタスク一覧』の各サブタスクをクリックして、サブタスクの詳細を確認できます。<br>さらに、各々のサブタスクにサードタスクを登録できます。</p> |
<br>

# 技術構成

## 使用技術
| カテゴリ | 技術内容 |
| --- | --- | 
| 開発環境 | Docker | 
| サーバーサイド | Ruby on Rails 7.1.3・Ruby 3.3.1 |
| フロントエンド | JavaScript |
| CSSフレームワーク | Tailwind CSS |
| Web API | OpenAI API(GPT-4)・Google API |
| データベースサーバー | PostgreSQL |
| アプリケーションサーバー | render |
| バージョン管理ツール | GitHub |
<br>

## ER図
[![Image from Gyazo](https://i.gyazo.com/c9be8a17a702535cc18d2cded37c8a20.png)](https://gyazo.com/c9be8a17a702535cc18d2cded37c8a20)
<br>

## 画面遷移図
https://www.figma.com/design/jT5qXGIR3ucVM8cHhX61OO/Untitled?node-id=0%3A1&t=Hd5qDinych2vgcKM-1
