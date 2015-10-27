require 'spec_helper'

describe FreshmailApi do
  let(:url) { "https://api.freshmail.com/rest/#{path}" }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:client) { Faraday.new { |builder| builder.adapter(:test, stubs) }}

  before do
    allow(described_class).to receive(:client) { client }

    described_class.configure do |config|
      config.api_key    = 'api_key_1'
      config.api_secret = 'api_secret_1'
    end
  end

  describe '.configuration' do
    it 'not be nil' do
      expect(described_class.configuration.api_key).not_to be(nil)
      expect(described_class.configuration.api_secret).not_to be(nil)
    end

    it 'api_key should eq api_key_1' do
      expect(described_class.configuration.api_key).to eq('api_key_1')
    end

    it 'api_secret should eq api_secret_1' do
      expect(described_class.configuration.api_secret).to eq('api_secret_1')
    end
  end

  context 'Ping' do
    let(:path) { 'ping' }
    it '.get_ping' do
      stubs.get(url) { |env| [ 200, {}, '{"status": "get_ping OK"}']}
      expect(described_class.get_ping).to eq({ 'status' => 'get_ping OK' })
    end

    it '.post_ping' do
      stubs.post(url) { |env| [ 200, {}, '{"status": "post_ping OK"}']}
      expect(described_class.post_ping({data: 'data'})).to eq({ 'status' => 'post_ping OK' })
    end
  end

  context 'Account' do
    let(:path) { 'account/create' }
    it '.create_account' do
      stubs.post(url) { |env| [ 200, {}, '{"status": "create_account OK"}']}
      expect(described_class.create_account({data: 'data'})).to eq({ 'status' => 'create_account OK' })
    end
  end

  context 'Mail' do
    let(:path) { 'mail' }
    it '.send_mail' do
      stubs.post(url) { |env| [ 200, {}, '{"status": "send_mail OK"}']}
      expect(described_class.send_mail({data: 'data'})).to eq({ 'status' => 'send_mail OK' })
    end
  end

  context 'Sms' do
    let(:path) { 'sms' }
    it '.send_sms' do
      stubs.post(url) { |env| [ 200, {}, '{"status": "send_sms OK"}']}
      expect(described_class.send_sms({data: 'data'})).to eq({ 'status' => 'send_sms OK' })
    end
  end

  context 'SpanTest' do
    let(:path) { 'spam_test/check' }
    it '.check_spam_test' do
      stubs.post(url) { |env| [ 200, {}, '{"status": "check_spam_test OK"}']}
      expect(described_class.check_spam_test({data: 'data'})).to eq({ 'status' => 'check_spam_test OK' })
    end
  end

  context 'Report' do
    describe '.campaigns_list' do
      let(:path) { 'reports/campaignsList/1' }
      it do
        stubs.get(url) { |env| [ 200, {}, '{"status": "campaigns_list OK"}']}
        expect(described_class.campaigns_list(1)).to eq({ 'status' => 'campaigns_list OK' })
      end
    end

    describe '.campaign_report' do
      let(:path) { 'reports/campaign/1' }
      it do
        stubs.get(url) { |env| [ 200, {}, '{"status": "campaign_report OK"}']}
        expect(described_class.campaign_report(1)).to eq({ 'status' => 'campaign_report OK' })
      end
    end

    describe '.campaign_time_details' do
      let(:path) { 'reports/campaignTimeDetails/1' }
      it do
        stubs.get(url) { |env| [ 200, {}, '{"status": "campaign_time_details OK"}']}
        expect(described_class.campaign_time_details(1)).to eq({ 'status' => 'campaign_time_details OK' })
      end
    end
  end

  context 'Campaign' do
    describe '.create_campaign' do
      let(:path) { 'campaigns/create' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "create_campaign OK"}']}
        expect(described_class.create_campaign({data: 'data'})).to eq({ 'status' => 'create_campaign OK' })
      end
    end

    describe '.edit_campaign' do
      let(:path) { 'campaigns/edit' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "edit_campaign OK"}']}
        expect(described_class.edit_campaign({data: 'data'})).to eq({ 'status' => 'edit_campaign OK' })
      end
    end

    describe '.delete_campaign' do
      let(:path) { 'campaigns/delete' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "delete_campaign OK"}']}
        expect(described_class.delete_campaign({data: 'data'})).to eq({ 'status' => 'delete_campaign OK' })
      end
    end

    describe '.send_test_campaign' do
      let(:path) { 'campaigns/sendTest' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "send_test_campaign OK"}']}
        expect(described_class.send_test_campaign({data: 'data'})).to eq({ 'status' => 'send_test_campaign OK' })
      end
    end

    describe '.send_campaign' do
      let(:path) { 'campaigns/send' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "send_campaign OK"}']}
        expect(described_class.send_campaign({data: 'data'})).to eq({ 'status' => 'send_campaign OK' })
      end
    end
  end

  context 'SubscribersList' do
    describe '.create_subscribers_list' do
      let(:path) { 'subscribers_list/create' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "create_subscribers_list OK"}']}
        expect(described_class.create_subscribers_list({data: 'data'})).to eq({ 'status' => 'create_subscribers_list OK' })
      end
    end

    describe '.update_subscribers_list' do
      let(:path) { 'subscribers_list/update' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "update_subscribers_list OK"}']}
        expect(described_class.update_subscribers_list({data: 'data'})).to eq({ 'status' => 'update_subscribers_list OK' })
      end
    end

    describe '.delete_subscribers_list' do
      let(:path) { 'subscribers_list/delete' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "delete_subscribers_list OK"}']}
        expect(described_class.delete_subscribers_list({data: 'data'})).to eq({ 'status' => 'delete_subscribers_list OK' })
      end
    end

    describe '.get_subscribers_lists' do
      let(:path) { 'subscribers_list/lists' }
      it do
        stubs.get(url) { |env| [ 200, {}, '{"status": "get_subscribers_lists OK"}']}
        expect(described_class.get_subscribers_lists).to eq({ 'status' => 'get_subscribers_lists OK' })
      end
    end

    describe '.add_field_to_subscribers_list' do
      let(:path) { 'subscribers_list/addField' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "add_field_to_subscribers_list OK"}']}
        expect(described_class.add_field_to_subscribers_list({data: 'data'})).to eq({ 'status' => 'add_field_to_subscribers_list OK' })
      end
    end

    describe '.get_subscribers_list_fields' do
      let(:path) { 'subscribers_list/getFields' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "get_subscribers_list_fields OK"}']}
        expect(described_class.get_subscribers_list_fields({data: 'data'})).to eq({ 'status' => 'get_subscribers_list_fields OK' })
      end
    end
  end

  context 'Subscriber' do
    describe '.add_subscriber' do
      let(:path) { 'subscriber/add' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "add_subscriber OK"}']}
        expect(described_class.add_subscriber({data: 'data'})).to eq({ 'status' => 'add_subscriber OK' })
      end
    end

    describe '.edit_subscriber' do
      let(:path) { 'subscriber/edit' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "edit_subscriber OK"}']}
        expect(described_class.edit_subscriber({data: 'data'})).to eq({ 'status' => 'edit_subscriber OK' })
      end
    end

    describe '.get_subscriber' do
      let(:path) { 'subscriber/get/1/some@mail.com' }
      it do
        stubs.get(url) { |env| [ 200, {}, '{"status": "get_subscriber OK"}']}
        expect(described_class.get_subscriber({list: 1, email: 'some@mail.com'})).to eq({ 'status' => 'get_subscriber OK' })
      end
    end

    describe '.delete_subscriber' do
      let(:path) { 'subscriber/delete' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "delete_subscriber OK"}']}
        expect(described_class.delete_subscriber({data: 'data'})).to eq({ 'status' => 'delete_subscriber OK' })
      end
    end

    describe '.get_subscriber_history' do
      let(:path) { 'subscriber/getHistory' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "get_subscriber_history OK"}']}
        expect(described_class.get_subscriber_history({data: 'data'})).to eq({ 'status' => 'get_subscriber_history OK' })
      end
    end

    describe '.add_subscribers' do
      let(:path) { 'subscriber/addMultiple' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "add_subscribers OK"}']}
        expect(described_class.add_subscribers({data: 'data'})).to eq({ 'status' => 'add_subscribers OK' })
      end
    end

    describe '.edit_subscribers' do
      let(:path) { 'subscriber/editMultiple' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "edit_subscribers OK"}']}
        expect(described_class.edit_subscribers({data: 'data'})).to eq({ 'status' => 'edit_subscribers OK' })
      end
    end

    describe '.update_subscriber_field' do
      let(:path) { 'subscriber/updateFieldValue' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "update_subscriber_field OK"}']}
        expect(described_class.update_subscriber_field({data: 'data'})).to eq({ 'status' => 'update_subscriber_field OK' })
      end
    end

    describe '.get_subscribers' do
      let(:path) { 'subscriber/getMultiple' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "get_subscribers OK"}']}
        expect(described_class.get_subscribers({data: 'data'})).to eq({ 'status' => 'get_subscribers OK' })
      end
    end

    describe '.delete_subscribers' do
      let(:path) { 'subscriber/deleteMultiple' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "delete_subscribers OK"}']}
        expect(described_class.delete_subscribers({data: 'data'})).to eq({ 'status' => 'delete_subscribers OK' })
      end
    end

    describe '.block_subscribers' do
      let(:path) { 'subscriber/addBlocks' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "block_subscribers OK"}']}
        expect(described_class.block_subscribers({data: 'data'})).to eq({ 'status' => 'block_subscribers OK' })
      end
    end

    describe '.unblock_subscribers' do
      let(:path) { 'subscriber/removeBlocks' }
      it do
        stubs.post(url) { |env| [ 200, {}, '{"status": "unblock_subscribers OK"}']}
        expect(described_class.unblock_subscribers({data: 'data'})).to eq({ 'status' => 'unblock_subscribers OK' })
      end
    end
  end
end
