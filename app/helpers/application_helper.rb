module ApplicationHelper
    #
    # 改行コードをbrタグへ変換する
    #
    def linebreak_to_br(text)
      h(text).gsub(/\r\n|\r|\n/, '<br />').html_safe
    end

    #
    # BOMを削除する
    #
    def remove_bom(text)
        text.gsub("\xEF\xBB\xBF".force_encoding("UTF-8"),"")
    end
end
