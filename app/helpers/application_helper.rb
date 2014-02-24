module ApplicationHelper
    # 改行コードをbrタグへ変換する
    def linebreak_to_br(text)
      h(text).gsub(/\r\n|\r|\n/, '<br />').html_safe
    end
end
