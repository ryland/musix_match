module MusixMatch
  module API
    class Search < Base
      def search_track(options={})
        response = get('track.search', options)
        TrackSearchResult.new(response)
      end

      def search_artist(options={})
        response = get('artist.search', options)
        ArtistSearchResult.new(response)
      end

      def self.search_track(options={})
        Search.new.search_track(options)
      end

      def self.search_artist(options={})
        Search.new.search_artist(options)
      end
    end
  end
end
