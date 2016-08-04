module MusixMatch
  class AlbumTracksResult
    attr_reader :response, :status_code, :execute_time, :available, :track_list

    def initialize(response)
      @response = response
      @track_list = []
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
        response['message']['body']['track_list'].each do |obj|
          @track_list.push << Models::Track.new(obj['track'])
        end
      end
    end
  end
end
