---
Title: Azure DevOpsアドオン 1-Click Child-Links
Category:
- DEV
Date: 2021-02-14T22:45:00+09:00
URL: https://neputa.hatenadiary.com/entry/2021/02/14/azure-devops-boards-childlinks
EditURL: https://blog.hatena.ne.jp/neputa/neputa.hatenadiary.com/atom/entry/14945776032069533135
---

[f:id:neputa:20260826225055w:plain:alt=アイキャッチ画像 夕暮れの湖畔のイラスト]

## Azure DevOps Boardsのタスクを毎回作るのがめんどい

[:contents]

個人開発だがタスク管理に「Azure DevOps Boards」を使っている。 Taskを毎回手動で作るのはめんどいため「1-Click Child-Links」というプラグインを使用している。

[f:id:neputa:20260826225103w:plain:alt=blog image]

## 「1-Click Child-Links」のインストール

- 以下のリンクからプラグインのページを開きます
  [1-Click Child-Links - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=ruifig.vsts-work-item-one-click-child-links)

-「Get it free」のボタンをクリック。
  [f:id:neputa:20260826225110w:plain:alt=手順１]

- Azure DeoOpsの組織を選択し、「Install」ボタンをクリック。※権限がない場合は、Administratorへ申請する画面が開くので許可を貰ってください。
  [f:id:neputa:20260826225117w:plain:alt=手順２]

- 「You are all set！」が表示されたらインストール完了です。
  [f:id:neputa:20260826225123w:plain:alt=手順３]

## 「1-Click Child-Links」の使い方

### 作成例の前提条件

※「Work item process」は「Scrum」を選択している。AgileやBasicを使っている場合は固有名詞を適宜読み替えを。

作成例として「Bug」と「Product Backlog Item」に、それぞれ自動で追加するTaskのセットを設定する。

#### Bug

- 再現・原因調査
- \*テスト作成
- \*実装・修正
- \*ローカルにコミット
- \*リモートへプッシュ

#### Product Backlog Item

- 技術調査
- 設計
- \*テスト作成
- \*実装・修正
- \*ローカルにコミット
- \*リモートへプッシュ

「\*」は共通、それ以外はItem固有のTask。

### 実際に作ってみる

Azure DeoOpsのプロジェクトページ左下の「歯車」をクリック
[f:id:neputa:20260826225130w:plain:alt=手順４]

画面右上の「左矢印」をクリック
[f:id:neputa:20260826225138w:plain:alt=手順５]

Boardsのエリアにある「Team configuration」をクリック
[f:id:neputa:20260826225145w:plain:alt=手順６]

画面上の「Templates」をクリック
[f:id:neputa:20260826225152w:plain:alt=手順７]

「Task」の「New template」をクリック
[f:id:neputa:20260826225200w:plain:alt=手順８]

各項目を埋め保存する

- Name：これはテンプレート名、ご自由に。
- Description：重要。どのWork Itemに対して生成するかを括弧\[\]内にカンマ区切りで記載する。画像の例は、「Product Backlog Item」と「Bug」に、このテンプレートを自動追加する設定。
- Add new field：デフォルト値をここで定義する。
- Add a comment：テンプレートのメモ。

[f:id:neputa:20260826225207w:plain:alt=手順9]

「New template」または「Create copy」で必要分をどんどん追加する
[f:id:neputa:20260826225215w:plain:alt=手順10]

こんな感じになる。画像の赤印は共通のTemplate、黄印はBug、青印はProduct Backlog Item固有の3種を登録した。
[f:id:neputa:20260826225222w:plain:alt=手順11]

Bugに正しく「Bug固有」と「共通」のテンプレートが追加できるか試してみる。新規作成し保存する。
[f:id:neputa:20260826225229w:plain:alt=手順12]

保存したら、画面右上の「…」から「1-Click Child-Links」をクリックする
[f:id:neputa:20260826225237w:plain:alt=手順13]

できた。
[f:id:neputa:20260826225244w:plain:alt=手順14]

以上。
