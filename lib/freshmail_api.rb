require 'faraday'
require 'json'
require 'freshmail_api/version'
require 'freshmail_api/configuration'
require 'freshmail_api/authorization'
require 'freshmail_api/client'
require 'freshmail_api/ping'
require 'freshmail_api/mail'
require 'freshmail_api/sms'
require 'freshmail_api/account'
require 'freshmail_api/spam_test'
require 'freshmail_api/report'
require 'freshmail_api/campaign'
require 'freshmail_api/subscriber'
require 'freshmail_api/subscribers_list'

module FreshmailApi
  extend Authorization
  extend Client
  extend Ping
  extend Mail
  extend Sms
  extend Subscriber
  extend Account
  extend SpamTest
  extend Report
  extend Campaign
  extend SubscribersList

  class << self

    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
