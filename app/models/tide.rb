# 
# 潮汐データを管理するオブジェクト
#
class Tide < ActiveResource::Base
    # 日付パラメータ（今日データを取得するための値）
    TIDE_GET_DATE_PARAM_VALUE_OF_TODAY = 'today'.freeze
    # 日付パラメータの日付フォーマット
    TIDE_GET_DATE_PARAM_FORMAT = '%Y/%m/%d'.freeze
    # 潮汐データの潮位レベルの単位
    TIDE_GET_RESULT_TIDE_LEVEL_UNIT = 'cm'.freeze

    attr_accessor :tides, :date, :sun_rise, :sun_set, :moon_rise, :moon_set
    alias_attribute :moon_age, :getsurei
    alias_attribute :tide_name, :shiomei
    
    self.site = 'http://www.e-tsuri.info/'
    self.format = :xml
    self.timeout = 20

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
        port_param = port.presence || default_port_name
        date_param = convert_date_param(date)

        model = Tide.find(:one, from: '/tide', params: { p: port_param, d: date_param }) 
        model.tap {|m| bind_addtional_attr m } unless model.nil?
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
        model.sun_rise= safe_parse_time(model.hinode)
        model.sun_set = safe_parse_time(model.hinoiri)
        model.moon_rise = safe_parse_time(model.tsukinode)
        model.moon_set = safe_parse_time(model.tsukinoiri)

        model.tides = model.tide.rstrip.split(/\r?\n/).map {|tide| 
            tide_infos = tide.chomp.split()

            time = safe_parse_time(tide_infos[0])
            tide_level = tide_infos[1].delete(TIDE_GET_RESULT_TIDE_LEVEL_UNIT).to_i
            { time: time, tide_level: tide_level }
        }
    end

   #
   # 初回表示する港名を取得する。
   #
   def self.default_port_name
     Port.first.name
   end

   #
   # 表示日付のパラメータを取得する。
   # パラメータが存在し、日付として解析できるもののみパラメータとして認める。
   #
   def self.convert_date_param(date)
     return TIDE_GET_DATE_PARAM_VALUE_OF_TODAY unless date.present?

     begin
       Date.parse(date).strftime(TIDE_GET_DATE_PARAM_FORMAT)
     rescue
       TIDE_GET_DATE_PARAM_VALUE_OF_TODAY
     end
   end

   #
   # 時刻をパースする
   #
   def self.safe_parse_time(time)
     return nil unless time.present?

     begin
       Time.parse(time)
     rescue
       nil
     end
   end
end
