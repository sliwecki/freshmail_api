module FreshmailApi
  module Report

    def campaigns_list(page='')
      perform(:get, "reports/campaignsList/#{page}")
    end

    def campaign_report(id_hash)
      perform(:get, "reports/campaign/#{id_hash}")
    end

    def campaign_time_details(id_hash)
      perform(:get, "reports/campaignTimeDetails/#{id_hash}")
    end
  end
end
