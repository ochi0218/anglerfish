# 
# 天気データを管理するオブジェクト
#
class Weather < ActiveResource::Base
  self.site = 'http://weather.livedoor.com/'
  self.format = :json
  self.timeout = 20

  #
  # 指定の港名から天気情報を取得する。
  #
  def self.get(port)
    weather_spot = weather_spot_id(port)
    return nil if weather_spot.nil?

    Weather.find(:one, from: '/forecast/webservice/json/v1', params: { city: weather_spot })
  end

  #
  # 指定日の天気予報を取得する。
  #
  def forecast_of_date(date)
    return nil if self.forecasts.nil?

    self.forecasts.each do |forecast|
      if safe_convert_date(forecast.date) == date
        return forecast
      end
    end
    nil
  end

  private

  #
  # 天気予報のスポットIDを取得する
  #
  def self.weather_spot_id(port_name)
    return nil unless port_name.present?

    port = Port.find_by_name(port_name)
    port.weather_spot_id unless port.nil?
  end

  #
  # 安全に日付をパースする。
  #
  def safe_convert_date(date)
    return nil unless date.present?

    begin
      Date.parse(date)
    rescue
      nil
    end
  end
end
