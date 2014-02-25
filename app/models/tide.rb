class Tide < ActiveResource::Base
    self.site = 'http://www.e-tsuri.info/'
    self.format = :xml

    attr_accessor :high_tides, :low_tides
    alias_attribute :moon_age, :getsurei
    alias_attribute :tide_name, :shiomei
    alias_attribute :sun_rise, :hinode
    alias_attribute :sun_set, :hinoiri
    alias_attribute :moon_rise, :tsukinode
    alias_attribute :moon_set, :tsukinoiri

    def self.today(port)
        Tide.find(:one, from: '/tide', params: { p: port, d: 'today' })
    end

    def tides
        tide.rstrip.split(/\r?\n/).map {|tide| tide.chomp.split() }
    end
end
