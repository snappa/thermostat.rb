#!/usr/bin/ruby

$LOAD_PATH.unshift "../lib"

require "yaml"
require 'thermostat'
include Proliphix

c = YAML.load_file("../account.yaml")
t = Thermostat.new(c["ip"], c["user"], c["passwd"])

# sets the heat to 68 degrees F
t.heat_to = 68


