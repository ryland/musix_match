module MusixMatch
  module API
    class Artist < Base
      def get_albums(options={})
        response = get('artist.albums.get', options)
        ArtistAlbumsResult.new(response)
      end

      def self.get_albums(options={})
        self.new.get_albums(options)
      end
    end
  end
end
