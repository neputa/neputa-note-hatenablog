import { codeToHtml } from "https://esm.sh/shiki@3.0.0"

const pres = document.querySelectorAll("pre.code")

pres.forEach((pre) => {
    const lang = pre.dataset.lang
    const rawCode = pre.textContent.trim()

    ;(async () => {
        const codeHtml = await codeToHtml(rawCode, {
            theme: "github-dark",
            lang: lang,
            transformers: [
                {
                    name: 'add-meta',
                    pre(node) {
                        this.addClassToHast(node, 'shiki')
                        node.properties['data-lang'] = lang
                    },
                    line(node, line) {
                        this.addClassToHast(node, 'line')
                    }
                },
            ]
        })

        // 1. HTML文字列をDOM要素に変換
        const tempDiv = document.createElement("div")
        tempDiv.innerHTML = codeHtml
        const shikiPre = tempDiv.querySelector("pre") // 生成されたpreを取得

        // 2. コピーボタンを作成
        const btn = document.createElement("button")
        btn.className = "copy-btn"
        btn.textContent = "Copy"

        // 3. クリックイベントを設定
        btn.onclick = () => {
            // rawCode (ハイライト前の生のテキスト) をクリップボードへ
            navigator.clipboard.writeText(rawCode).then(() => {
                // フィードバック表示
                const originalText = btn.textContent
                btn.textContent = "Copied!"
                btn.classList.add("copied")

                // 2秒後に元に戻す
                setTimeout(() => {
                    btn.textContent = originalText
                    btn.classList.remove("copied")
                }, 2000)
            }).catch(err => {
                console.error('Copy failed', err)
                btn.textContent = "Error"
            })
        }

        // 4. 生成されたpreの中にボタンを追加
        shikiPre.appendChild(btn)

        // 5. 元のpreを置き換え
        pre.replaceWith(shikiPre)
    })()
})
