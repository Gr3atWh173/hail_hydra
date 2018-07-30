require_relative "../lib/hail_hydra.rb"

RSpec.describe HailHydra::Torrent do
  it "returns a torrent object" do
    expect(HailHydra::Torrent.new).to be_a_kind_of HailHydra::Torrent
  end

  it "returns a custom torrent" do
    args = {
      name: "Test torrent name",
      url: "https://someurl.com/somefile.ext",
      seeders: "1443",
      leechers: "20"
    }
    torrent = HailHydra::Torrent.new(args)

    expect(torrent.name).to eq args[:name]
    expect(torrent.url).to eq args[:url]
    expect(torrent.seeders).to eq args[:seeders]
    expect(torrent.leechers).to eq args[:leechers]
  end
end
