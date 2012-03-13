module MusixMatch  
  module API
    class RelatedArtist < Base
      def get_related(options={})
        response = get('artist.related.get', options)
        RelatedArtistResult.new(response)
      end
      
      def self.get_related(options={})
        self.new.get_related(options)
      end
    end
  end
end
