module FreshmailApi
  module Sms

    def send_sms(data)
      perform(:post, 'sms', data)
    end
  end
end
