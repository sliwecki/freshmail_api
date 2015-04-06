module FreshmailApi
  module Account

    def create_account(data)
      perform(:post, 'account/create', data)
    end
  end
end
