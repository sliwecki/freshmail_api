module FreshmailApi
  module Ping

    def get_ping
      perform(:get, 'ping')
    end

    def post_ping(data)
      perform(:post, 'ping', data)
    end
  end
end
