class Tide < ActiveResource::Base
    self.site = 'http://www.e-tsuri.info/'
    self.format = :xml

    attr_accessor :high_tides, :low_tides
    alias_attribute :moon_age, :getsurei
    alias_attribute :tide_name, :shiomei

    def self.today(port)
        Tide.find(:one, from: '/tide', params: { p: port, d: 'today' })
    end

    def self.get(date, port)
        date_param = date.strftime('%Y/%m/%d')
        port_param = port
        Tide.find(:one, from: '/tide', params: { p: port_param, d: date_param }) 
    end

    def tides
        tide.rstrip.split(/\r?\n/).map {|tide| 
            tide_infos = tide.chomp.split()
            time = Time.parse(tide_infos[0])
            tide_level = tide_infos[1]
            { time: time, tide_level: tide_level }
        }
    end

    def date
        Date.new(year.to_i, month.to_i, day.to_i)
    end

    def sun_rise
        Time.parse(hinode)
    end

    def sun_set
        Time.parse(hinoiri)
    end
    
    def moon_rise
        Time.parse(tsukinode)
    end

    def moon_set
        Time.parse(tsukinoiri)
    end
end
