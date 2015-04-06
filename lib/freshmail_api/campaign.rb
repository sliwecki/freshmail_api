module FreshmailApi
  module Campaign

    def create_campaign(data)
      perform(:post, 'campaigns/create', data)
    end

    def edit_campaig(data)
      perform(:post, 'campaigns/edit', data)
    end

    def delete_campaig(data)
      perform(:post, 'campaigns/delete', data)
    end

    def send_test_campaig(data)
      perform(:post, 'campaigns/sendTest', data)
    end

    def send_campaig(data)
      perform(:post, 'campaigns/send', data)
    end
  end
end
