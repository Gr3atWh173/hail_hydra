#!/usr/bin/env ruby

require 'hail_hydra'

domain = "https://thepiratebay.org"
search = ARGV[0]
pages = ARGV[1].nil? ? 0 : ARGV[1]

puts "NAME\t\t\t\t"
HailHydra::TPB.new(domain).search(search, pages).each do |result|
  puts result.name + "\t\t\t\t" + result.url
end
