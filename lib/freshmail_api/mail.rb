module FreshmailApi
  module Mail

    def send_mail(data)
      perform(:post, 'mail', data)
    end
  end
end
