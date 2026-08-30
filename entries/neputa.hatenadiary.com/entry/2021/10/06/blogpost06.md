---
Title: 【Ubuntu/mozc】日本語入力切り替えショートカットキーを非トグルに変更する
Category:
- DEV
- Ubuntu
Date: 2021-10-06T07:00:00+09:00
URL: https://neputa.hatenadiary.com/entry/2021/10/06/blogpost06
EditURL: https://blog.hatena.ne.jp/neputa/neputa.hatenadiary.com/atom/entry/14945776032070847023
---

[f:id:neputa:20260830170907w:plain:alt=アイキャッチ画像]

[:contents]

## 本記事の背景

前回に引き続き、中古ノートPCにUbuntu 20.04LTS（日本語Remix版）をインストールした後の作業。

作業量が思いのほか膨らんだ「IME」関連をまとめたもの。

IME関連で行った主な作業は下記の2つ。

1. mozcのデフォルト入力モードを「直接入力」から「ひらがな」に変更する（前回記事）
2. **入力切り替えのショートカットキーを割り当てる（今回記事）**

前回の記事はこちら↓

- [入力モードのデフォルトを「ひらがな」にする【Ubuntu】- neputa note](/entry/2021/10/05/blogpost05)

## 前提

本記事は、前回ソースファイルを修正した「fcitx-mozc」がすでにインストール済みを前提に話しを進める。

fcitx-mozcのインストールはこちらのコマンドで行える。ただ、入力モードに問題があるため前回記事を参照のうえ修正版をインストールすることをオススメする。

```bash
sudo apt update && sudo apt -y install fcitx-mozc
```

## 今回作業の目的

- Ubuntu OSの日本語入力を切り替えるショートカットキーをカスタマイズする
- 切り替えはトグル式ではなく、IMEのオンおよびオフそれぞれにショートカットキーを割り当てる
- 割り当てるキーはそれぞれ下記の通りとする
  - IMEオンCapsLock
  - IMEオフalt + CapsLock
- 入力切り替えに影響ある不要となったショートカットキーをすべて削除する。

## システムおよびデバイス環境

### OS

Ubuntu 20.04LTS（日本語Remix版）

### IME

fcitx-mozc

### キーボード

USキーボード

### 「ibus」ではなく「fcitx」を採用する理由

単純に、割り当てたいショートカットキーにaltキーを含んでいるため。

ibusでは、現状altキーの割り当てができない。

## 作業概要

- まず、ショートカットキーとして使用するCapsLockキーの設定を変更する。
- 不要となる既存の入力切り替えに関連するショートカットキーをすべて削除する。
- 削除対象は「mozc」と「Ubuntuの設定」の2カ所
- 最終的に「fcitx」でショートカットキーを割り当てる。

## 作業詳細

### CapsLockキーの設定変更

これは入力切り替えに関係なく行った方がいい作業だと思う。

今回は、CapsLockキーをIMEオンオフに使うためこれを行う。

設定作業は「gnome-tweaks」というツールを使用する。

1. gnome-tweaksをインストールする

    ```bash
    sudo apt update
    sudo apt upgrade -y
    sudo apt install gnome-tweaks -y
    ```

2. gnome-tweaksを起動する

3. 画面左の「キーボードとマウス」を選択肢、「追加のレイアウトオプション」をクリック

    [f:id:neputa:20260830170915w:plain:alt=gnome-tweaks 01]

4. Ctrl positionの「Caps LockをCtrlとして扱う」にチェック

    [f:id:neputa:20260830170922w:plain:alt=gnome-tweaks 02]

5. Caps Lock behaviorの「Caps Lock is also a Ctrl」を選択

    [f:id:neputa:20260830170929w:plain:alt=gnome-tweaks 03]

6. 以上でCapsLockキーの設定変更は完了

### 不要なショートカットの削除

#### mozcのキー設定

1. Ubuntuの設定アプリを画面左のDockまたはコマンド「gnome-control-center」で起動する

2. 左のメニューから「地域と言語」を選択肢、「日本語（Mozc）」の歯車をクリック

    [f:id:neputa:20260830170937w:plain:alt=mozc キー設定 01]

3. 「Mozcプロパティ」ウインドウの、「キー設定」→「キー設定の選択」にある「編集ボタン」をクリック

    [f:id:neputa:20260830170944w:plain:alt=mozc キー設定 02]

4. 「Mozcキー設定」ウインドウの「コマンド」をクリックしてソートし、「IMEを無効化」「IMEを有効化」の行をすべて右クリックから削除する

    [f:id:neputa:20260830170951w:plain:alt=mozc キー設定 03]

5. 「OKボタン」をクリックし、mozcの不要ショートカットキー削除作業は完了

#### 設定アプリのキーボードショートカットの設定変更

1. 先ほどのUbuntu設定アプリを開き、右側のメニューから「キーボードショートカット」を選択する

    [f:id:neputa:20260830170959w:plain:alt=ubuntu settings 01]

2. タイピングの「前の入力ソースへと切り替える」と「次の入力ソースへ切り替える」それぞれ、ダブルクリックし、ESCキーを押して「無効」にする

    [f:id:neputa:20260830171007w:plain:alt=fcitx 01]

### 入力切り替えのショートカットキーを割り当て

1. 「fcitx設定」を起動する（「fcitx」という名前のアプリもあるが「fcitx設定」を使用）

2. 全体の設定のホットキータブを開く

3. 「show Advanced Options」にチェックを入れる

4. 入力メソッドのオンオフ（トグル）をダブルクリックし、ESCキーを押して「空」にする（2か所）

5. 入力メソッドをオンに（Mozcがオフになる）をダブルクリックし、キーを割り当てる（Alt ＋ Lctrl）

6. 入力メソッドをオフに（Mozcがオンになる）をダブルクリックし、キーを割り当てる（Lctrl）

[f:id:neputa:20260830171015w:plain:alt=fcitx 01]

キー割り当てが左右に2つあるのは、fcitxは2種のキー設定を割り当てることができるから。

5。と6。は、使用したいキーをお好みで。

上の説明は「CapsLock」でmozcをオン、「Alt + CapsLock」でmozcをオフとしている。

## 終わりに

ツールがいろいろあり、GUIを使用して最後まで作業を行うことができた。

「Ubuntuを普段使いしてみたい」との思いからチャレンジしているが、以前と比べると敷居がやや下がったように感じる。

この他にもUbuntuインストール後に行った作業があるので近いうちにまとめリンクを追加します。

もしなにかしらお役に立ちましたらこの記事をシェアしていただけるとはげみになります。

<div data-vc_mylinkbox_id='887409868'></div>

## 参考サイト

- [Ubuntu 20.04 LTSをインストールした直後に行う設定 & インストールするソフト](https://sicklylife.jp/ubuntu/2004/settings.html)
