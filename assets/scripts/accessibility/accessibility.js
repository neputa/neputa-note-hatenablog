/* デザイン → カスタマイズ → フッタ */

(function () {
  function fixMainLandmark() {
    const main = document.getElementById('main-inner');

    if (main && !main.hasAttribute('role')) {
      main.setAttribute('role', 'main');
    }
  }

  function fixEntryThumbLinks() {
    document.querySelectorAll('a.entry-thumb-link').forEach(function (link) {
      if (link.getAttribute('aria-label')) {
        return;
      }

      const entry = link.closest('.archive-entry');

      if (!entry) {
        return;
      }

      const title =
        entry.querySelector('.entry-title a') ||
        entry.querySelector('.entry-title') ||
        entry.querySelector('h2 a') ||
        entry.querySelector('h3 a');

      if (!title) {
        return;
      }

      const text = title.textContent.trim();

      if (text) {
        link.setAttribute(
          'aria-label',
          '記事「' + text + '」を読む'
        );
      }
    });
  }

  function init() {
    fixMainLandmark();
    fixEntryThumbLinks();

    const observer = new MutationObserver(function () {
      fixMainLandmark();
      fixEntryThumbLinks();
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
