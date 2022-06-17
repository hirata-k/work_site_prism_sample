require 'site_prism'

module Google

  # トップページ最上部のメニュー
  class MenuSection < SitePrism::Section
    element :gmail, :xpath, '//a[text()="Gmail"]'
    element :images, :xpath, '//a[text()="画像"]'
    element :google_apps, :xpath, '//a[@title="Google アプリ"]'
    element :login_button, :xpath, '//a[text()="ログイン"]' # ログアウト時
  end

  # トップページ最下部のフッター
  class FooterSection < SitePrism::Section
    element :ads, :xpath, '//a[text()="広告"]'
    element :services, :xpath, '//a[text()="ビジネス"]'
    element :about, :xpath, '//a[text()="Googleについて"]'
    element :privacy, :xpath, '//a[text()="プライバシー"]'
    element :policies, :xpath, '//a[text()="規約"]'
    element :preferences, :xpath, '//a[text()="設定"]'
  end

  class SearchResultSection < SitePrism::Section
    element :title, 'a'
  end

  # トップページの各オブジェクトと機能
  class Home < SitePrism::Page
    set_url 'https://www.google.co.jp/'
    set_url_matcher %r{www.google.co.jp/?}

    section :menu, MenuSection, '#gb'

    element :search_form, :xpath, '//form[@id="tsf"]'
    # 必要な要素・関数をここに書くこと

    section :footer, FooterSection, '#footer'
  end

  # 検索結果ページの各オブジェクトと機能
  class SearchResults < SitePrism::Page
    set_url_matcher %r{www.google.co.jp/search?.*} # リンクなどから遷移してきた時にチェックされる

    sections :search_results, SearchResultSection, :xpath, '//h3[@class="r"]'
    # 必要な要素、関数をここに書くこと

  end

end
