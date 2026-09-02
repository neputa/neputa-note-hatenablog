---
Title: ノートアプリJoplinをVSCodeで使用する（拡張機能を使用）
Category:
- DEV
- VSCode
Date: 2024-04-16T23:35:00+09:00
URL: https://neputa.hatenadiary.com/entry/2024/04/16/vscode-joplin
EditURL: https://blog.hatena.ne.jp/neputa/neputa.hatenadiary.com/atom/entry/14945776032072992306
---

[f:id:neputa:20260903003718w:plain:alt=アイキャッチ画像 夕暮れの湖畔のイラスト]

[:contents]

## 記事概要

### 本記事のゴール

拡張機能を使用し、VSCodeでJoplinのノートを管理できるようにする。

### 本記事の対象者

- Joplinユーザでエディタに不満がある人
- VSCodeの環境でJoplinを使いたい人
- VScodeユーザでVScodeと親和性の高いノートアプリを検討している方

### 背景

- 現在まとまったメモを「Joplin」で管理している。
- 概ね満足しているが肝心のエディタにややストレスがある。
- これは私がvim入力（正確にはNeovim）に依存かつJoplinのvimに制限が多いことに起因する。
- 私にとって現在もっとも快適なエディタはVSCode。（Neovimの設定が概ね通る）
- つまり「Joplin」と「VSCode」がひとつになってしまえばいいのに。

## Joplinとは

公式サイト：

[Joplin](https://joplinapp.org/)

以前、Joplinの使い方について書いた記事。

[https://www.neputa-note.net/entry/2020/10/07/joplin:embed:cite]

## 環境

- OS：WSL2 on Windows11
- Joplin：version 2.14.20
- VSCode：version 1.88.1

## 作業概要

1. VSCodeにJoplinの拡張機能を追加する
2. Joplinの拡張機能にJoplinのWebClipの認証トークンを設定する
3. Joplinを常駐起動しておく

## 作業詳細

VSCodeを起動し、拡張機能「joplin-vscode-plugin」をインストールする。

[https://marketplace.visualstudio.com/items?itemName=rxliuli.joplin-vscode-plugin&utm_source=pocket_saves:embed:cite]

Joplinを起動し、メニュー → ツール → オプション → Webクリッパー を開く。

「ステップ1」の「Webクリッパーサービスを有効にする」をクリックし有効化する。（VSCodeからJoplinのデータアクセスに、Webクリッパー用のAPIを利用する）

[f:id:neputa:20260903003818w:plain:alt=Joplin Webクリッパー有効化画面]

同画面の最下部「詳細な設定」の「認証トークン」をコピーしておく。（VSCodeの拡張機能で使用する）

[f:id:neputa:20260903003910w:plain:alt=Joplin 認証トークン]

VSCodeに戻り、「拡張機能の設定」を開く。

[f:id:neputa:20260903003947w:plain:alt=VSCode 拡張機能の設定]

設定最下部の項目「Joplin: Token」に先ほどコピーしたトークンを貼り付ける。

[f:id:neputa:20260903004010w:plain:alt=VSCode Joplin Tokenを貼り付け]

VSCodeをリロードすると画面左にJoplinのアイコンが表示される。これをクリックまたはショートカットキー[Ctrl]＋[j]→ +[J]で、VScode上にJoplinのノートを展開できる。

条件として、Joplinを常駐起動させておく必要がある。

[f:id:neputa:20260903004038w:plain:alt=VSCodeでJoplinを表示]

マークダウンのプレビューを隣に表示するショートカットキーは［Ctrl］＋［K］→［V］

キーボードショートカットの基本設定→「joplin:」で拡張機能、「markdown:」でマークダウンのキー設定を変更できる。

## まとめ

JoplinにNeovimのプラグインが誕生すると良いなと思い続けていたが、VSCode側にJoplinを取り込む発想はなかった。

VSCode＋Neovim拡張機能で整えたエディタ環境そのままにJoplinを利用できる。しかもすべて無償で利用できてしまっている。

各ツール開発者の皆様、心より感謝申し上げる。
