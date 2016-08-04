module MusixMatch
  module Models
    class Album
      include Model
      include Searcher

      model_with_attributes :album_id, :album_name, :format, :album_coverart_100x100

      def self.tracks(album_id)
        API::Album.get_tracks({:album_id => album_id})
      end

    end
  end
end
