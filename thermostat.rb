require 'net/http'
require 'uri'
require 'open-uri'

class Thermostat
    def initialize(ip, user, passwd)
        @ip = ip
        @user = user
        @passwd = passwd
    end

    def url
        return "http://#{@ip}"
    end
end
