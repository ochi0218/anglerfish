# 
# 潮汐データを管理するオブジェクト
#
class Tide < ActiveResource::Base
    TIDE_GET_DATE_PARAM_VALUE_OF_TODAY = 'today'.freeze
    TIDE_GET_DATE_PARAM_FORMAT = '%Y/%m/%d'.freeze
    TIDE_GET_RESULT_TIDE_LEVEL_UNIT = 'cm'.freeze

    attr_accessor :tides, :date, :sun_rise, :sun_set, :moon_rise, :moon_set
    alias_attribute :moon_age, :getsurei
    alias_attribute :tide_name, :shiomei
    
    self.site = 'http://www.e-tsuri.info/'
    self.format = :xml

    # 
    # 指定の港名から本日の潮汐情報を取得する。
    #
    def self.today(port)
        self.get TIDE_GET_DATE_PARAM_VALUE_OF_TODAY, port
    end

    # 
    # 指定の港名から指定の日付の潮汐情報を取得する。
    #
    def self.get(date, port)
        date_param = (date == TIDE_GET_DATE_PARAM_VALUE_OF_TODAY ? date : date.strftime(TIDE_GET_DATE_PARAM_FORMAT))
        port_param = port
        model = Tide.find(:one, from: '/tide', params: { p: port_param, d: date_param }) 
        bind_addtional_attr model unless model.nil?
        model
    end

    #
    # 満潮の潮位データを取得する。
    #
    def high_tides
        if tides.at(0)[:tide_level] > tides.at(1)[:tide_level]
            [tides.at(0), tides.at(2)]
        else
            [tides.at(1), tides.at(3)]
        end
    end

    #
    # 干潮の潮位データを取得する。
    #
    def low_tides
        if tides.at(0)[:tide_level] < tides.at(1)[:tide_level]
            [tides.at(0), tides.at(2)]
        else
            [tides.at(1), tides.at(3)]
        end
    end

    private

    # 
    # 追加で指定した属性に値を格納する。
    #
    def self.bind_addtional_attr(model)
        model.date = Date.new(model.year.to_i, model.month.to_i, model.day.to_i)
        model.sun_rise= Time.parse(model.hinode)
        model.sun_set = Time.parse(model.hinoiri)
        model.moon_rise = Time.parse(model.tsukinode)
        model.moon_set = Time.parse(model.tsukinoiri)

        model.tides = model.tide.rstrip.split(/\r?\n/).map {|tide| 
            tide_infos = tide.chomp.split()

            time = Time.parse(tide_infos[0])
            tide_level = tide_infos[1].delete(TIDE_GET_RESULT_TIDE_LEVEL_UNIT).to_i
            { time: time, tide_level: tide_level }
        }
    end
end
