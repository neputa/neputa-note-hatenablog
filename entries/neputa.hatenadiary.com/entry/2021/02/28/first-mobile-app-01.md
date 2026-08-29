---
Title: 01．はじめてスマホアプリを作ってみた（検討フェーズ）
Category:
- DEV
- MobileApps
Date: 2021-02-28T11:00:00+09:00
URL: https://neputa.hatenadiary.com/entry/2021/02/28/first-mobile-app-01
EditURL: https://blog.hatena.ne.jp/neputa/neputa.hatenadiary.com/atom/entry/14945776032069533166
---

[f:id:neputa:20260826233621w:plain:alt=アイキャッチ画像]

[:contents]

## 記事の概要

先日こちらに書いたことの詳細。

- [アラフォー初心者だけどスマホアプリを開発～リリースまでがんばってみた - neputa note](/entry/2021/02/13/onethird-release)

インストールはこちらから。

<a href='https://play.google.com/store/apps/details?id=com.neputafactory.onethird' target='_blank' >
  <img src='https://cdn-ak.f.st-hatena.com/images/fotolife/n/neputa/20260826/20260826233629.webp' alt='Google Play で手に入れよう' width="250px" height="83px">
</a>

> [!WARNING]
> Androidのみ iOS版は現在リリース未定

スマホアプリ開発未経験者が個人で開発からリリースするまでをの記録。

それなりのボリュームがあるため全7回に分けて書いてみたい。

1. 検討フェーズ（どんなアプリを作るか）【今回】
2. [要件フェーズ（どんな要件のアプリにするか）](/entry/2021/03/01/first-mobile-app-02)
3. [調査フェーズ（どんな技術を使うか）](/entry/2021/03/02/first-mobile-app-03)
4. [設計フェーズ（どうやって作るか）](entry/2021/03/03/first-mobile-app-04)
5. [開発フェーズ（実際に作りはじめる）](/entry/2021/03/04/first-mobile-app-05)
6. [公開フェーズ（アプリを公開する）](/entry/2021/03/05/first-mobile-app-06)
7. [保守フェーズ（公開から現在まで）](/entry/2021/03/06/first-mobile-app-07)

はじめてスマホアプリを作るにあたり、迷ったこと、どうやって解決したか、をできるだけ詳細に書いてみる。

拙いながらもどなたかの役に立てればうれしい。

今回は「検討フェーズ」でやったことをまとめていく。

## はじめてのスマホアプリ開発 検討フェーズ

### 「スマホアプリを作ってみたい」と思ったキッカケ

[f:id:neputa:20260826233636w:plain:alt=an image of opportunity]
_Photo by [Gabby K](https://www.pexels.com/ja-jp/@gabby-k?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)_

最初に思い立ったのは昨年2020年の6月ごろ。

COVID-19新型コロナウイルスの影響ですっかり生活様式が一変するなか、幸い私や近しいところで致命的な被害を受けることは無かった。

ただ閉塞感が増す状況下で精神的な疲労を感じ始めていた。

受け身一辺倒の生活はどうしても疲弊するもの。

多趣味だったりストレス解消の術があればいいが、これといったものがない。

何か没頭できることが必要だ。

寝食を忘れ取り組めることを始めたい、というのが一番のキッカケだった。

### なぜスマホアプリ？

[f:id:neputa:20260826233644w:plain:alt=an image of mobile apps]
_Photo by [Pixabay](https://www.pexels.com/ja-jp/@pixabay?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)_

10年以上前、かつて仕事でプログラムを書いていたことがある。

と言っても、もともと理系の履修経験もなく、運よく採用してもらった会社の情シスで少々たしなんだ程度だが。

その後はまったく別業種へ転職し以降10年以上プログラムを書くこともなく過ごしてきた。

仕事ではあまりいい思い出はなかったが、プログラミングへの興味だけは残っていた。

技術関連の記事を眺めたりする程度のことはしていた。

そして「何か没頭できるものを」と考えたとき、過去に読んだ「スマホアプリを開発してみた」系の記事が頭に浮かんだ。

「何をどうすれば始められるのかもわからないけれど、とにかくやってみよう」、そんな気持ちでスタートを切った。

### 何を作ればいいか考える

[f:id:neputa:20260826233652w:plain:alt=an image of thinking]
_Photo by [Pixabay](https://www.pexels.com/ja-jp/@pixabay?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)_

かつて関わっていたシステムは業務システム。

コンシューマ向けの開発は未経験、スマホアプリも未経験、調べなければならないことはたくさんありそう。

この時点ではやや怖気づいていた。

とはいえもっとも大事な「何を作るか」「何を作りたいか」が決まりさえすれば、あとはそれを実現する手段に過ぎないと謎の自信もあった。

いきなりにして最重要といえるのが「何を作るか」。

「作業量に圧倒されたり、行き詰ったりするたびにモチベーションを維持できるモノにしよう」というのがまず頭に浮かぶ。

どんなコトであれば、高いモチベーションを維持できるだろうか。

「誰かに喜んでもらえる」「めっちゃ儲かる」「世界が平和になる」、いろいろあると思う。

地味に地道に行きたい自分の性格的に「自分自身が日々使うもの」「できれば使い続けるメリットが自分自身にある」ことが重要と思い至った。

### 「睡眠記録アプリ」に決定する

[f:id:neputa:20260826233659w:plain:alt=an image of sleeping]
_Photo by [いらすとや](https://www.irasutoya.com/2018/11/blog-post_95.html)_

私は長年「睡眠」という生活行動を苦手としてきた。

また、このブログの更新頻度やTwitterのツイート数からわかる通り、恒常的に何かをすることも苦手だ。

「睡眠を日々記録するアプリ」なら、この「2つの苦手」を克服する手助けになるのではないか。

将来的に天候や気温差などと併せて分析できたらいいな、など夢は膨らむ。

ということで、

- 自分で作ったアプリならば継続して使うだろう
- 自分で使うアプリだからいいものを作ろうと頑張れるだろう

この相乗効果を狙いに定め、まずは「睡眠を日々記録する」をサポートしてくれるアプリを作ってみることに決めた。

次回は「要件フェーズ」について書きたいと。

## はじめてスマホアプリを作ってみた 記事一覧

1. 検討フェーズ（どんなアプリを作るか）【今回】
2. [要件フェーズ（どんな要件のアプリにするか）](/entry/2021/03/01/first-mobile-app-02)
3. [調査フェーズ（どんな技術を使うか）](/entry/2021/03/02/first-mobile-app-03)
4. [設計フェーズ（どうやって作るか）](entry/2021/03/03/first-mobile-app-04)
5. [開発フェーズ（実際に作りはじめる）](/entry/2021/03/04/first-mobile-app-05)
6. [公開フェーズ（アプリを公開する）](/entry/2021/03/05/first-mobile-app-06)
7. [保守フェーズ（公開から現在まで）](/entry/2021/03/06/first-mobile-app-07)
