module TidesHelper
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
end
