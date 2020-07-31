require "httparty"
require "json"
require "addressable/uri"
require "cgi"
require_relative "torrent.rb"

module HailHydra
  # The TPB class provides the main client to connect to and scrape the 
  # results.
  class TPB
    # remember the domain name and get the cookie to use from the TPB server
    def initialize domain="https://apibay.org"
      @domain = domain
    end

    # search torrents
    def search query
      get = make_search_request query
      raise "Invalid response: #{get.response.code}" unless get.response.code == "200"
      return parse_search_results JSON.parse(get.response.body) 
    end

    private

    def parse_search_results json_results
      torrents = []
      json_results.each do |result|
        torrent = HailHydra::Torrent.new
        torrent.name        = result["name"]
        torrent.seeders     = result["seeders"]
        torrent.leechers    = result["leechers"]
        torrent.uploaded_by = result["username"]        
        torrent.uploaded_at = Time.at(result["added"].to_i).to_s
        torrent.size        = make_size(result["size"].to_i)
        torrent.magnet_link = make_magnet_link(result["info_hash"], result["name"])
        torrents.push torrent
      end
      return torrents
    end

    private

    def make_magnet_link info_hash, name
      # used CGI.escape because URI.encode now throws a warning and Addressable doesn't seem to 
      # support not-URL strings
      return "magnet:?xt=urn:btih:#{info_hash}&dn=#{CGI.escape(name)}#{trackers}"
    end

    def trackers
      tr = '&tr=' + Addressable::URI.encode('udp://tracker.coppersurfer.tk:6969/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://9.rarbg.to:2920/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.opentrackr.org:1337')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.internetwarriors.net:1337/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.leechers-paradise.org:6969/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.coppersurfer.tk:6969/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.pirateparty.gr:6969/announce')
      tr += '&tr=' + Addressable::URI.encode('udp://tracker.cyberia.is:6969/announce')
      return tr
    end

    def make_size size
      return ((size / 1125899906842624).round(3)).to_s + "PiB" if size >= 1125899906842624
      return ((size / 1099511627776).round(3)).to_s + "TiB" if size >= 1099511627776
      return ((size / 1073741824).round(3)).to_s + "GiB" if size >= 1073741824
      return ((size / 1048576).round(3)).to_s + "MiB" if size >= 1048576
      return ((size / 1024).round(3)).to_s + "KiB" if size >= 1024
    end

    def make_search_request query 
      encoded_uri = Addressable::URI.encode(@domain + "/q.php?q=" + query)
      HTTParty.get encoded_uri
    end
  end
end
