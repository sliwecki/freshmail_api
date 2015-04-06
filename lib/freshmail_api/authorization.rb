module FreshmailApi
  module Authorization

    def authorize(path, data)
      Digest::SHA1.hexdigest([
        configuration.api_key,
        path,
        data,
        configuration.api_secret
      ].join)
    end
  end
end
