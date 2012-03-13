require 'spec_helper'

describe MusixMatch::RelatedArtistResult do
  it 'should set status_code' do
    response = load_fixture('artist.related.get')
    result = MusixMatch::RelatedArtistResult.new(response)
    result.status_code.should == 200
  end
  
  it 'should set execute_time' do
    response = load_fixture('artist.related.get')
    result = MusixMatch::RelatedArtistResult.new(response)
    result.execute_time.should == 0.077892065048218
  end

  it 'should set available' do 
    response = load_fixture('artist.related.get')
    result = MusixMatch::RelatedArtistResult.new(response)
    result.available.should == "20"
  end
  
  it 'should initialize a new artist with the first artist of artist_list' do
    response = load_fixture('artist.related.get')
    MusixMatch::Models::Artist.should_receive(:new).with(response['message']['body']['artist_list'].first['artist'])
    MusixMatch::RelatedArtistResult.new(response)
  end
end
