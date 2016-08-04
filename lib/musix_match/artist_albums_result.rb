module MusixMatch
  class ArtistAlbumsResult
    attr_reader :response, :status_code, :execute_time, :available, :album_list

    def initialize(response)
      @response = response
      @album_list = []
      parse_response(response)
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
      if status_code == 200
        response['message']['body']['album_list'].each do |obj|
          @album_list.push << Models::Album.new(obj['album'])
        end
      end
    end
  end
end
