require 'spec_helper'

describe MusixMatch::API::Album do

  album_tracks_response = load_fixture('album.tracks.get')

  it "should initialize a new Album object and call get_tracks" do
    search = double(MusixMatch::API::Album)
    MusixMatch::API::Album.should_receive(:new).and_return(search)
    options = { :album_id => 1 }
    search.should_receive(:get_tracks).with(options)
    MusixMatch::API::Album.get_tracks(options)
  end

  it "should call get with album.tracks.get and initialize a Album" do
    search = MusixMatch::API::Album.new
    options = { :album_id => 1 }
    search.should_receive(:get).with('album.tracks.get', options).and_return(album_tracks_response)
    MusixMatch::AlbumTracksResult.should_receive(:new).with(album_tracks_response)
    search.get_tracks(options)
  end
end
