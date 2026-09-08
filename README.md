# HatenaBlog Workflows Boilerplate(β)

- 個人ではてなブログを運用するBoilerplateのクローン
- 本家リポジトリ - [hatena/Hatena-Blog-Theme-Boilerplate](https://github.com/hatena/Hatena-Blog-Theme-Boilerplate)

## 予約投稿について

- はてなブログでは記事の予約投稿が利用可能ですが、このBoilerplateから記事の予約投稿を行うことはできません。記事を予約投稿するには、はてなブログの記事の編集画面から設定を行ってください。
  - [日時を指定して予約投稿する（編集オプション） - はてなブログ ヘルプ https://help.hatenablog.com/entry/editor/publish/schedule]
  - ※予約投稿の設定を行ったあと、記事が投稿されるまでにこのワークフローを経由して記事の変更を行うと、予約投稿の設定が解除されてしまいますのでご注意ください
- リポジトリで管理していた記事を予約投稿する場合、以下のいずれかの手順で予約投稿による変更を同期して頂く必要があります。

### プルリクエストをマージする方法

1. プルリクエストをデフォルトブランチにマージする
    - この際、`draft:true` を削除してはいけません
2. はてなブログ側で予約投稿を行う
3. 記事が公開されたら `pull form hatenablog` アクションを実行する
4. `/draft_entries` から予約投稿記事を削除する

### プルリクエストをクローズする方法

1. プルリクエストをクローズする
2. はてなブログ側で予約投稿を行う
3. 記事が公開されたら `pull from hatenablog` アクションを実行する

## プルリクエストテンプレートを利用する

- `create draft` アクションまたは `pull draft from hatenablog` アクションによってプルリクエストを作成する際、リポジトリに `.github/PULL_REQUEST_TEMPLATE.md` または `.github/PULL_REQUEST_TEMPLATE/draft.md` という名前のテンプレートファイルが存在すれば、そのテンプレートを利用してプルリクエストが作成されます。
- プルリクエストテンプレートでは以下のプレースホルダが利用可能です。これらのプレースホルダはプルリクエストの作成時には記事に固有の値に置き換えられます

| プレースホルダ | 値 |
| :------------: | :----: |
| `${EDIT_URL}`   | 下書き記事の編集画面のURL |
| `${PREVIEW_URL}` | 下書き記事のプレビューURL（まだプレビューURLがない場合は `なし`） |
| `${TITLE}` | 下書き記事の記事タイトル |
| `${ENTRY_ID}` | 下書き記事のID |
| `${OWNER_NAME}` | ブログのオーナーのアカウント名 |

## Boilerplateに新しく追加されたWorkflowを取得する

- workflowの変更は [hatena/hatenablog-workflows](https://github.com/hatena/hatenablog-workflows) を更新することによって提供されますので、GitHub Actionsの参照を更新していただくことで、機能の更新を利用できます。
- ただし、新しくworkflowが追加されたりした場合は、Boilerplateを元に作成されたリポジトリに新しいファイルを追加したり既存のファイルを更新する必要があります
- 新しいファイルを取得するには`scripts/download_boilerplate_workflows.sh`を実行してください

```bash
bash scripts/download_boilerplate_workflows.sh
```

### Scriptが見つからない場合

- 手元のリポジトリに上記のファイルがない場合があります
- お手数ですが、その場合は[こちらのファイル](https://github.com/hatena/Hatena-Blog-Workflows-Boilerplate/blob/main/scripts/download_boilerplate_workflows.sh)を自身のリポジトリに追加してください

## Tips

### カスタムURLを指定する

記事のURLは、特に指定しない場合投稿日時から自動的に決定されますが、カスタムURL機能を利用すると任意のURLを指定することができます。

GitHubから記事を編集する場合にもカスタムURLを指定することが可能です。指定する場合、記事の設定領域に `CustomPath` フィールドを追加します。
設定例は以下の通りです。

```markdown
---
Title: カスタムURLの設定例
EditURL: https://blog.hatena.ne.jp/hatenablog/example.hatenablog.com/atom/entry/0123456789
PreviewURL: https://example.hatenablog.com/draft/entry/xxxxxxx
Draft: true
CustomPath: custom/url
---
```

この記事を公開すると `https://example.hatenablog.com/entry/custom/url` として公開されます。

### 旧URLからの404対策（はてなブログ向け）

- はてなブログではサーバー側で任意の301/302リダイレクト設定はできないため、旧URL対策はデザイン設定のHTML欄にJavaScriptを配置して行います。
- このリポジトリでは `assets/scripts/redirect_list_min.txt` を元に、貼り付け用スクリプトを生成できます。

```bash
bash assets/scripts/generate_hatena_redirect_snippet.sh
```

- 生成先: `assets/scripts/hatena_redirect_snippet.js`
- 使い方: はてなブログ管理画面「デザイン > カスタマイズ > フッタ」または「ヘッダ」のHTML欄に貼り付ける

#### 未登録URLの推奨挙動

- マッピングに存在するURLのみリダイレクトする
- 未登録URLは404を維持する（トップページへの一律リダイレクトは行わない）

この方針は、検索エンジンにsoft-404と判定されるリスクを避けるための一般的な運用です。

## トラブルシューティング

### はてなブログ側のデータとリポジトリのデータとで差分が発生した場合

はてなブログのWebの編集画面から記事を更新するなど、はてなブログ側のデータとリポジトリのデータに差異が発生してしまう場合があります。
この場合、 Actions の `pull from hatenablog` を選択、`Branch: main`に対して実行してください。
実行すると、リポジトリの更新日時以降に更新された公開記事のデータを更新するプルリクエストが作成されます。
これをマージすることで、最新のデータに更新することができます。

## workflow に関する詳細

- 各 workflow では下記で提供されている Reusable workflows を利用しています
  - https://github.com/hatena/hatenablog-workflows
