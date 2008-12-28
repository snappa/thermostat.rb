Gem::Specification.new do |s|
    s.name = "thermostat"
    s.version = "0.0.2"
    s.author = "Sean Dague"
    s.email = "sean at dague dot net"
    s.homepage = "http://rubyforge.net/projects/rtc"
    s.platform = Gem::Platform::RUBY
    s.summary = "Ruby modules to control Prolipix IP Thermostats"
    s.files = [
               "lib/thermostat.rb", 
               "lib/pdp", 
               "lib/pdp/constants.rb", 
               "lib/pdp/oid.rb"
              ],
    s.require_path = "lib"
    s.autorequire = "thermostat"
    s.has_rdoc = true
    s.extra_rdoc_files = ["README"]
end
