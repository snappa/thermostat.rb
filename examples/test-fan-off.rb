#!/usr/bin/ruby

$LOAD_PATH.unshift "../lib"

require "yaml"
require 'thermostat'

c = YAML.load_file("../account.yaml")

t = Thermostat.new(c["ip"], c["user"], c["passwd"])

t.fan_off!

