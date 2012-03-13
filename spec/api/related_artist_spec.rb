require 'spec_helper'

describe MusixMatch::API::RelatedArtist do
  
  related_artists_response = load_fixture('artist.related.get')
  
  it "should initialize a new RelatedArtist object and call get_related" do
    search = mock(MusixMatch::API::RelatedArtist)
    MusixMatch::API::RelatedArtist.should_receive(:new).and_return(search)
    options = { :artist_id => 1 }
    search.should_receive(:get_related).with(options)
    MusixMatch::API::RelatedArtist.get_related(options)
  end
  
  it "should call get with artist.related.get and initialize a RelatedArtistResult" do
    search = MusixMatch::API::RelatedArtist.new
    options = { :artist_id => 1 }    
    search.should_receive(:get).with('artist.related.get', options).and_return(related_artists_response)
    MusixMatch::RelatedArtistResult.should_receive(:new).with(related_artists_response)
    search.get_related(options)
  end    
end
