module FreshmailApi
  module SpamTest

    def check_spam_test(data)
      perform(:post, 'spam_test/check', data)
    end
  end
end
