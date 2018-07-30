module HailHydra
  class Torrent
    attr_accessor :name
    attr_accessor :url
    attr_accessor :category
    attr_accessor :subcategory
    attr_accessor :uploaded_at
    attr_accessor :uploaded_by
    attr_accessor :magnet_link
    attr_accessor :torrent_link
    
    def initialize(args={})
      self.name = args[:name]
      self.url = args[:url]
      self.category = args[:category]
      self.subcategory = args[:subcategory]
      self.uploaded_at = args[:uploaded_at]
      self.uploaded_by = args[:uploaded_by]
      self.magnet_link = args[:magnet_link]
      self.torrent_link = args[:torrent_link]
    end
  end
end
