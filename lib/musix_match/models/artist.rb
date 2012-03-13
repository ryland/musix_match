module MusixMatch
  module Models
    class Artist
      include Model
      include Searcher
      
      model_with_attributes :artist_id, :artist_mbid, :artist_name, :artist_alias_list

      def self.related_artists(artist_id)
        API::RelatedArtist.get_related(:artist_id => artist_id)
      end

    end
  end
end
