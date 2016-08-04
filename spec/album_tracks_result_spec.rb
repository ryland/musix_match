require 'spec_helper'

describe MusixMatch::AlbumTracksResult do
  it 'should set status_code' do
    response = load_fixture('album.tracks.get')
    result = MusixMatch::AlbumTracksResult.new(response)
    result.status_code.should == 200
  end

  it 'should set execute_time' do
    response = load_fixture('album.tracks.get')
    result = MusixMatch::AlbumTracksResult.new(response)
    result.execute_time.should == 0.049185037612915
  end

  it 'should set available' do
    response = load_fixture('album.tracks.get')
    result = MusixMatch::AlbumTracksResult.new(response)
    result.available.should == 10
  end

  it 'should initialize a new track with the first track of track_list' do
    response = load_fixture('album.tracks.get')
    MusixMatch::Models::Track.should_receive(:new).with(response['message']['body']['track_list'].first['track'])
    MusixMatch::AlbumTracksResult.new(response)
  end
end
