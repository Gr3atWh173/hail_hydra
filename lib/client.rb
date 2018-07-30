require "httparty"
require "nokogiri"
require_relative "torrent.rb"

module HailHydra
  # The TPB class provides the main client to connect to and scrape the 
  # results. This may be broken into a 'client' and 'parser' in the future.
  class TPB
    # remember the domain name and get the cookie to use from the TPB server
    def initialize(domain_name)
      @domain = domain_name
      @headers = get_query_headers
    end

    # search torrents
    def search(query, pages=1, orderby=99)
      get = make_search_request(query, pages, orderby)
      raise "Invalid response: #{get.response.code}" unless get.response.code == "200"
      return parse_search_results(get.response.body)
    end

    private

    def parse_search_results(html_text)
      nodes = Nokogiri::HTML(html_text)
      cells = []
      table = nodes.search('table')
      #require 'pry'
      #binding.pry
      table.search('tr').each do |tr|
        cells.push(tr.search('th, td'))
      end
      torrents = []
      1.upto cells.length-1 do |i|
        torrent = HailHydra::Torrent.new()

        torrent.name        = cells[i][1].children[1].children[1].children[0].content
        torrent.url         = @domain +  cells[i][1].children[1].children[1].attributes["href"].value
        torrent.magnet_link = cells[i][1].children[3].attributes["href"].value
        torrent.seeders     = cells[i][2].children[0].content
        torrent.leechers    = cells[i][3].children[0].content
        
        torrents.push torrent
      end
      return torrents
    end

    def make_search_request(query, pages, orderby)
      query = {
        "q" => query,
        "page" => 0.to_s,
        "orderby" => orderby.to_s
      }

      # not sure why HTTParty doesn't do this already
      encoded_uri = URI.encode(@domain+"/search/" + query["q"] + "/0/" + query["orderby"] + "/0")
      HTTParty.get(encoded_uri, headers: @headers)
    end

    def get_query_headers()
      cookie = HTTParty.get(@domain).response['set-cookie']
      return {
        'User-Agent' => 'Mozilla/5.0 (Windows 10; WOW64; rv:10.0) Gecko/20100101 Firefox/10.0',
        'Referer' => @domain,
        'Cookie' => cookie
      }
    end
  end
end