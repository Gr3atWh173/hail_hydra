module HailHydra
  class Torrent
    attr_accessor :name
    attr_accessor :url
    attr_accessor :seeders
    attr_accessor :leechers
    attr_accessor :uploaded_at
    attr_accessor :uploaded_by
    attr_accessor :magnet_link
    
    def initialize(args={})
      self.name = args[:name]
      self.url = args[:url]
      self.seeders = args[:seeders]
      self.leechers = args[:leechers]
      self.uploaded_at = args[:uploaded_at]
      self.uploaded_by = args[:uploaded_by]
      self.magnet_link = args[:magnet_link]
    end
  end
end
