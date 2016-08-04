module MusixMatch
  module API
    class Album < Base
      def get_tracks(options={})
        response = get('album.tracks.get', options)
        AlbumTracksResult.new(response)
      end

      def self.get_tracks(options={})
        self.new.get_tracks(options)
      end
    end
  end
end
