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

  #
  # 文字列を日付に変換する
  #
  def parse_date(date_str)
    return Date.today unless date_str.present?

    begin
      Date.parse(date_str)
    rescue
      Date.today
    end
  end
end
