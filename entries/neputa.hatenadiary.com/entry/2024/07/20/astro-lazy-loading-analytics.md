---
Title: Astro Googleアナリティクス（GA4）のJavaScriptを遅延読み込みする
Category:
- DEV
- Astro
- WSL2
- nodejs
Date: 2024-07-20T03:00:00+09:00
URL: https://neputa.hatenadiary.com/entry/2024/07/20/astro-lazy-loading-analytics
EditURL: https://blog.hatena.ne.jp/neputa/neputa.hatenadiary.com/atom/entry/14945776032073027605
---

[f:id:neputa:20260903200917w:plain:alt=宇宙を背景にしたAstroとGoogle Analyticsのロゴ]

[:contents]

## 記事概要

- 先日のBloggerからAstroへ移行した記事の別途詳細

※参考 - Blog移行記事

[https://www.neputa-note.net/entry/2024/07/01/migrated-blogger-to-astro:embed:cite]

### 目的

- Astroで構築したWebサイトにGoogleアナリティクスの設定を行う
- Partytownというパッケージを使用し、JavaScriptを遅延読み込みできるようにする
  - [Welcome To Partytown](https://partytown.builder.io/)

## 用語説明

### Astro とは？

> Astroは、ブログやマーケティング、eコマースなど、コンテンツ駆動のウェブサイトを作成するためのウェブフレームワークです。Astroは、新しいフロントエンドアーキテクチャを開拓し、他のフレームワークと比較してJavaScriptのオーバーヘッドと複雑さを低減することで知られています。高速でSEOに優れたウェブサイトが必要なら、Astroが最適です。<br>
> -- [Astro公式Docs](https://docs.astro.build/ja/concepts/why-astro/) より引用をDeepLで翻訳

- 参考記事
  - [Webフレームワーク「Astro」とは？開発初心者からベテランまで注目する理由](https://codezine.jp/article/detail/17883)

### Partytown とは？

> Partytown は、リソースを大量に消費するスクリプトをメインスレッドからウェブワーカーに移行するための遅延ロードライブラリです。メインスレッドをあなたのコードに捧げ、サードパーティのスクリプトをウェブワーカーにオフロードすることで、サイトの高速化を支援することを目的としています。<br>
> -- [Partytown](https://partytown.builder.io/)より引用 をDeepLで翻訳

## 作業環境

- OS - Ubuntu-22.04LTS on WSL2
- Node.js - v20.14.0
- pnpm - v9.4.0
- Astro - v4.11.3

## 作業詳細

- Partytownのパッケージをインストールする

```bash
pnpm add -D @astrojs/partytown
```

### astro.config.mjs

- astro.config.mjsにpartytownをimportし設定を追加する

```javascript
import { defineConfig } from 'astro/config'
import partytown from '@astrojs/partytown'

export default defineConfig({
  integrations: [
    partytown({
      config: {
        forward: ['dataLayer.push']
      }
    })
  ]
})
```

- Googleアナリティクス用のcomponentを作成する
- typeをtext/partytownとするのがポイント
- ViewTransitionsを使用している場合、is:inline と data-astro-rerunを追加する
  - ページ遷移した際にJavaScriptを実行させるため

### GoogleAnalytics.astro

```astro
---
const gaId: string = 'G-XXXXXXXXXX'
---

<>
  <script
    is:inline
    data-astro-rerun
    type='text/partytown'
    src=`https://www.googletagmanager.com/gtag/js?id=${gaId}`></script>
  <script is:inline data-astro-rerun type='text/partytown' define:vars={{ gaId }}>
    window.dataLayer = window.dataLayer || []
    function gtag() {
      dataLayer.push(arguments)
    }
    gtag('js', new Date())
    gtag('config', gaId)
    console.log(gaId)
  </script>
</>
```

### BaseLayout.astro

- Layoutのheadタグにcomponentを追加する

```astro
---
import GoogleAnalytics from '@/components/meta/GoogleAnalytics'
---

<html lang='ja'>
  <head>
    <!-- 省略-->
    <GoogleAnalytics />
  </head>

  <!-- 省略-->
</html>
```

- デバッグしブラウザのデベロッパーツールで確認する
- コンソールにpartytownのworkerが起動し、初期化成功のログが流れればOK

[f:id:neputa:20260903200925w:plain:title=デベロッパーツールのコンソール:alt=デベロッパーツールのコンソール]

## 補足

- Partytownはサードパーティのスクリプトを遅延読み込みしてくれるパッケージだが、動作するものとしないものがある
- Googleアナリティクスは今回の実装で問題なく動作することを確認した
- 未検証だが、Googleタグマネージャーの実装例は多く見つかる
- Google Adsenseを検証したが私の実力では動作させることはできなかった。
- よってAdsenseの遅延読み込みは自力で実装しており詳細は次回記事にまとめる

以上

## 参考サイト

- [Add google analytics to Astro with Partytown](https://www.kevinzunigacuellar.com/blog/google-analytics-in-astro/)
