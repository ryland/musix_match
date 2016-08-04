require 'spec_helper'

describe MusixMatch::API::Search do

  track_search_response   = {'message' => {'body' => {'track_list' => [] }, 'header' => { 'status_code' => 200, 'execute_time' => 1, 'available' => 10 }}}
  artist_search_response   = {'message' => {'body' => {'artist_list' => [] }, 'header' => { 'status_code' => 200, 'execute_time' => 1, 'available' => 20 }}}

  it "should initialize a new Search object and call search_track" do
    search = double(MusixMatch::API::Search)
    MusixMatch::API::Search.should_receive(:new).and_return(search)
    options = { :q_artist => 'artist name' }
    search.should_receive(:search_track).with(options)
    MusixMatch::API::Search.search_track(options)
  end

  it "should call get with track.search and initialize a TrackSearchResult" do
    search = MusixMatch::API::Search.new
    options = { :q_artist => 'artist name' }
    search.should_receive(:get).with('track.search', options).and_return(track_search_response)
    MusixMatch::TrackSearchResult.should_receive(:new).with(track_search_response)
    search.search_track(options)
  end

  it "should initialize a new Search object and call search_artist" do
    search = double(MusixMatch::API::Search)
    MusixMatch::API::Search.should_receive(:new).and_return(search)
    options = { :q_artist => 'artist name' }
    search.should_receive(:search_artist).with(options)
    MusixMatch::API::Search.search_artist(options)
  end

  it "should call get with artist.search and initialize a ArtistSearchResult" do
    search = MusixMatch::API::Search.new
    options = { :q_artist => 'artist name' }
    search.should_receive(:get).with('artist.search', options).and_return(artist_search_response)
    MusixMatch::ArtistSearchResult.should_receive(:new).with(artist_search_response)
    search.search_artist(options)
  end
end
