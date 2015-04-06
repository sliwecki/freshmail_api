module FreshmailApi
  module Client

    ENDPOINT = 'https://api.freshmail.com'

    def perform(method, path, data={})
      data = parse_data(data)
      path = "/rest/#{path}"
      response = client.send(method, path) do |request|
        request.headers = headers(path, data)
        request.body    = data if method == :post
      end

      JSON.parse(response.body)
    end

    private

    def client
      @client ||= Faraday.new(ENDPOINT)
    end

    def parse_data(data)
      data.empty? ? '' : data.to_json
    end

    def headers(path, data)
      {
        'Content-Type'   => 'application/json',
        'X-Rest-ApiKey'  => configuration.api_key,
        'X-Rest-ApiSign' => authorize(path, data)
      }
    end
  end
end
