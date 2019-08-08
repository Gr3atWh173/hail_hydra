require_relative "../lib/hail_hydra.rb"

DOMAIN = "https://thepiratebay.org"

RSpec.describe HailHydra do
  it "has a version number" do
    expect(HailHydra::VERSION).not_to be nil
  end

  it "returns a TPB object" do
    expect(HailHydra::TPB.new(DOMAIN)).to be_a_kind_of HailHydra::TPB
  end

  it "returns an array of Torrents" do
    a = HailHydra::TPB.new(DOMAIN).search("darkness")
    expect(a).to be_a_kind_of Array
    expect(a[0]).to be_a_kind_of HailHydra::Torrent
    expect(a[0].uploaded_by).to be_a_kind_of String
    expect(a[0].uploaded_at).to be_a_kind_of String
    expect(a[0].size).to be_a_kind_of String
  end
end
