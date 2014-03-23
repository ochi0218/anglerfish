module TidesHelper

  #
  # 月齢画像を表示する。
  #
  def moon_age_image(moon_age_str)
    moon_age = moon_age_str.to_f
    if moon_age >= 29 || moon_age < 2
      image = 'Moon-New.svg'
    elsif moon_age >= 2 && moon_age < 6
      image = 'Moon-Waxing-Crescent.svg'
    elsif moon_age >= 6 && moon_age < 10
      image = 'Moon-First-Quarter.svg'
    elsif moon_age >= 10 && moon_age < 14
      image = 'Moon-Waxing-Gibbous.svg'
    elsif moon_age >= 14 && moon_age < 17
      image = 'Moon-Full.svg'
    elsif moon_age >= 17 && moon_age < 21
      image = 'Moon-Waning-Gibbous.svg'
    elsif moon_age >= 21 && moon_age < 25
      image = 'Moon-Last-Quarter.svg'
    elsif moon_age >= 25 && moon_age < 29
      image = 'Moon-Waning-Crescent.svg'
    end
    "/assets/weather-icons/svg/#{image}"
  end

  #
  # 天気画像を表示する。
  #
  def weather_image(weather_icon_url)
    if weather_icon_url == 'http://weather.livedoor.com/img/icon/1.gif'
      image = 'Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/2.gif'
      image = 'Cloud-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/3.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/4.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/5.gif'
      image = 'Cloud-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/6.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/7.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/8.gif'
      image = 'Cloud.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/9.gif'
      image = 'Cloud-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/10.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/11.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/12.gif'
      image = 'loud-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/13.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/14.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/15.gif'
      image = 'Cloud-Rain.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/16.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/17.gif'
      image = 'Cloud-Rain-Alt.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/18.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/19.gif'
      image = 'Cloud-Rain-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/20.gif'
      image = 'Cloud-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/21.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/22.gif'
      image = 'Cloud-Rain.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/23.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/24.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/25.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/26.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/27.gif'
      image = 'Cloud-Snow-Sun.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/28.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/29.gif'
      image = 'Cloud-Snow.svg'
    elsif weather_icon_url == 'http://weather.livedoor.com/img/icon/30.gif'
      image = 'Cloud-Snow.svg'
    end

    "/assets/weather-icons/svg/#{image}"
  end
end

