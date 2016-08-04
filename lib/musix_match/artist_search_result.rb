module MusixMatch
  class ArtistSearchResult
    attr_reader :response, :status_code, :execute_time, :available, :artist_list

    def initialize(response)
      @response = response
      @artist_list = []
      parse_response(response)
    end

    def each
      @artist_list.each do |artists|
        yield artists
      end
    end

  protected

    def parse_response(response)
      parse_response_header(response)
      parse_response_body(response)
    end

    def parse_response_header(response)
      [:status_code, :execute_time, :available].each do |key|
        instance_variable_set "@#{key}", response['message']['header'][key.to_s]
      end
    end

    def parse_response_body(response)
      response['message']['body']['artist_list'].each do |obj|
        @artist_list << Models::Artist.new(obj['artist'])
      end
    end
  end
end
