require 'spec_helper'

describe MusixMatch::API::Artist do

  get_albums_response   = {'message' => {'body' => {'album_list' => [] }, 'header' => { 'status_code' => 200, 'execute_time' => 1, 'available' => 10 }}}

  it "should initialize a new Artist object and call get_albums" do
    artist = double(MusixMatch::API::Artist)
    MusixMatch::API::Artist.should_receive(:new).and_return(artist)
    options = { :artist_id => 1 }
    artist.should_receive(:get_albums).with(options)
    MusixMatch::API::Artist.get_albums(options)
  end

  it "should call get with artist.albums.get and initialize a ArtistAlbumsResult" do
    artist = MusixMatch::API::Artist.new
    options = { :artist_id => 1 }
    artist.should_receive(:get).with('artist.albums.get', options).and_return(get_albums_response)
    MusixMatch::ArtistAlbumsResult.should_receive(:new).with(get_albums_response)
    artist.get_albums(options)
  end
end
