#!/usr/bin/env ruby

require 'hail_hydra'

domain = "https://apibay.org"
search = ARGV[0]

HailHydra::TPB.new(domain).search(search).each do |result|
  puts ""
  puts "NAME: " + result.name
  puts "SIZE: " + result.size
  puts "SEEDERS: " + result.seeders
  puts "LEECHERS: " + result.leechers
  puts "MAGNET: " + result.magnet_link
end
