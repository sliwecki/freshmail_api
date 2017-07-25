<a href="https://codeclimate.com/github/sliwecki/freshmail_api"><img src="https://codeclimate.com/github/sliwecki/freshmail_api/badges/gpa.svg" /></a>

## FreshmailApi
Rails gem for fast integration your applications with Freshmail

Documentation of [Freshmail API](http://freshmail.pl/wp-content/uploads/2013/04/REST_API_v1.0.19.pdf)

## Installation

The simplest way to install gem is to use [Bundler](http://bundler.io/).

```ruby
gem 'freshmail_api'
```

Or install the latest version of the gem with the following command...

    $ gem install freshmail_api

## Usage

First, you must set up config (for example in config/initializers/freshmail_api.rb) with the following code:

```ruby
FreshmailApi.configure do |config|
  config.api_key = 'your api key'
  config.api_secret = 'your secret key'
end
```

Next, you can use available methods:

##### 1) Test your connection

GET:
```ruby
FreshmailApi.get_ping
```

POST:
```ruby
FreshmailApi.post_ping({data: 'some data'})
```

##### 2) Send mail:
```ruby
FreshmailApi.send_mail(subscriber: "subscriber@mail.com", subject: "test", text: "pure text message")
or
FreshmailApi.send_mail(subscriber: "subscriber@mail.com", subject: "test", html: "message with html tags")
```
>- require options:
:subscriber,
:subject,
:html or :text
>- optional options:
:from,
:from_name,
:reply_to,
:encoding,
:attachments,
:tracking,
:domain,
:tag

##### 3) Send sms message (SMS agreement required to send sms):
```ruby
FreshmailApi.send_sms(gsm: "123456789", text: "hello bro! :)")
```
>- require options:
:gsm,
:text
>- optional options:
:from,
:single


##### 4) Reports:
  4.1 Campaigns list
  ```ruby
  FreshmailApi.campaigns_list
  or
  FreshmailApi.campaigns_list(69)
  ```
  >- optional options:
  :page

  4.2 Campaign report
  ```ruby
  FreshmailApi.campaign_report(id_hash)
  ```
  >- required options:
  :id_hash

  4.3 Campaign time details
  ```ruby
  FreshmailApi.campaign_time_details(id_hash)
  ```
  >- required options:
  :id_hash


##### 5) Campaign:
  5.1 Create:
  ```ruby
  FreshmailApi.create_campaign({options})
  ```
  >- require options:
  :name,
  :list or :group,
  :html or :text
  >- optional options:
  :url,
  :subject,
  :from_address,
  :from_name,
  :reply_to,
  :resignlink

  5.1 Edit:
  ```ruby
  FreshmailApi.edit_campaign({options})
  ```
  >- require options:
  :id_hash
  >- optional options:
  :name,
  :url,
  :html,
  :text,
  :subject,
  :from_name,
  :from_address,
  :reply_to,
  :list,
  :group,
  :resignlink

  5.1 Delete:
  ```ruby
  FreshmailApi.delete_campaign({options})
  ```
  >- require options:
  :hash

  5.1 Send test campaign:
  ```ruby
  FreshmailApi.send_test_campaign(hash: '4zcnmd2ski', emails: ['test1@email.com', 'test2@email.com'])
  ```
  >- require options:
  :hash,
  :emails
  >- optional options:
  :custom_fields

  5.1 Send campaign:
  ```ruby
  FreshmailApi.send_campaign({options})
  ```
  >- require options:
  :hash
  >- optional options:
  :time (format:  YYYY-MM-DD H:i:s)


##### 6) Subscriber:
  6.1 Add:
  ```ruby
  FreshmailApi.add_subscriber({options})
  ```
  >- require options:
  :email,
  :list
  >- optional options:
  :state,
  :confirm,
  :custom_fields

  6.2 Edit:
  ```ruby
  FreshmailApi.edit_subscriber({options})
  ```
  >- require options:
  :email,
  :list
  >- optional options:
  :state,
  :custom_fields

  6.3 Get:
  ```ruby
  FreshmailApi.get_subscriber(email: 'test@email.com', list: '4zcnmd2ski')
  ```
  >- require options:
  :email,
  :list

  6.4 Delete:
  ```ruby
  FreshmailApi.delete_subscriber({options})
  ```
  >- require options:
  :email,
  :list

  6.5 History of subscriber:
  ```ruby
  FreshmailApi.get_subscriber_history(email: 'test@email.com', list: '4zcnmd2ski', limit: 30)
  ```
  >- require options:
  :email,
  :list
  >- optional options:
  :limit (default: 10)

  6.6 Add subscribers:
  ```ruby
  FreshmailApi.add_subscribers(subscribers: [{email: 'test@email.com'}, {email: 'test@email.com'}], list: '4zcnmd2ski')
  ```
  >- require options:
  :subscribers,
  :list
  >- optional options:
  :state,
  :confirm

  6.7 Edit subscribers:
  ```ruby
  FreshmailApi.edit_subscribers(subscribers: [{email: 'test@email.com'}, {email: 'test@email.com'}], list: '4zcnmd2ski')
  ```
  >- require options:
  :subscribers,
  :list
  >- optional options:
  :state,
  :confirm

  6.8 Update field value for all subscribers:
  ```ruby
  FreshmailApi.update_subscriber_field({options})
  ```
  >- require options:
  :listHash,
  :tag,
  :value,
  :url

  6.9 Get data from subscribers:
  ```ruby
  FreshmailApi.get_subscribers({options})
  ```
  >- require options:
  :subscribers,
  :list

  6.10 Delete subscribers:
  ```ruby
  FreshmailApi.delete_subscribers({options})
  ```
  >- require options:
  :subscribers,
  :list

  6.11 Block subscribers:
  ```ruby
  FreshmailApi.block_subscribers({options})
  ```
  >- require options:
  :emails

  6.12 Unblock subscribers:
  ```ruby
  FreshmailApi.unblock_subscribers({options})
  ```
  >- require options:
  :emails


##### 7) Create account:
```ruby
FreshmailApi.create_account({options})
```
>- require options:
:login,
:password,
:firstname,
:lastname,
:phone
>- optional options:
:company,
:activation_email,
:activation,
:child_account


##### 8) Subscribers list:
  8.1 Create:
  ```ruby
  FreshmailApi.create_subscribers_list({options})
  ```
  >- require options:
  :name
  >- optional options:
  :description,
  :custom_field

  8.2 Update:
  ```ruby
  FreshmailApi.update_subscribers_list({options})
  ```
  >- require options:
  :hash,
  :name
  >- optional options:
  :description

  8.3 Delete:
  ```ruby
  FreshmailApi.delete_subscribers_list({options})
  ```
  >- require options:
  :hash

  8.4 Get lists:
  ```ruby
  FreshmailApi.get_subscribers_lists
  ```

  8.5 Add extra field:
  ```ruby
  FreshmailApi.add_field_to_subscribers_list({options})
  ```
  >- require options:
  :hash,
  :name
  >- optional options:
  :tag,
  :type

  8.6 Get extra fields:
  ```ruby
  FreshmailApi.get_subscribers_list_fields({options})
  ```
  >- require options:
  :hash

##### 9) Spam test:
```ruby
FreshmailApi.check_spam_test({options})
```
>- require options:
:subject
>- optional options:
:from,
:from_name,
:html or :text


## Contributing

1. Fork it ( https://github.com/sliwecki/freshmail_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
