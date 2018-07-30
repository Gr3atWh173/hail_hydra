#!/usr/bin/env ruby

require 'hail_hydra'

domain = "https://thepiratebay.org"
search = ARGV[0]
pages = 1

HailHydra::TPB.new(domain).search(search, pages).each do |result|
  puts ""
  puts "NAME: " + result.name
  puts "URL: " + result.url
  puts "SEEDERS: " + result.seeders
  puts "LEECHERS: " + result.leechers
  puts "MAGNET: " + result.magnet_link
end
