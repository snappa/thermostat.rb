#!/usr/bin/ruby

$LOAD_PATH.unshift "../lib"

require "yaml"
require 'thermostat'

include Proliphix

c = YAML.load_file("../account.yaml")

t = Thermostat.new(c["ip"], c["user"], c["passwd"])

puts "Temp:         #{t.temp}"
puts "Mode:         #{t.mode}"
puts "Setback Heat: #{t.heat_to}"
puts "Setback Cool: #{t.cool_to}"
puts "Fan Mode:     #{(t.fan_on?) ? "On" : "Off"}"       




