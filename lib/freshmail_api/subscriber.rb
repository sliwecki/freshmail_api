module FreshmailApi
  module Subscriber

    def add_subscriber(data)
      perform(:post, 'subscriber/add', data)
    end

    def edit_subscriber(data)
      perform(:post, 'subscriber/edit', data)
    end

    def get_subscriber(data)
      perform(:get, "subscriber/get/#{data[:list]}/#{data[:email]}")
    end

    def delete_subscriber(data)
      perform(:post, 'subscriber/delete', data)
    end

    def get_subscriber_history(data)
      perform(:post, 'subscriber/getHistory', data)
    end

    def add_subscribers(data)
      perform(:post, 'subscriber/addMultiple', data)
    end

    def edit_subscribers(data)
      perform(:post, 'subscriber/editMultiple', data)
    end

    def update_subscriber_field(data)
      perform(:post, 'subscriber/updateFieldValue', data)
    end

    def get_subscribers(data)
      perform(:post, "subscriber/getMultiple", data)
    end

    def delete_subscribers(data)
      perform(:post, "subscriber/deleteMultiple", data)
    end

    def block_subscribers(data)
      perform(:post, "subscriber/addBlocks", data)
    end

    def unblock_subscribers(data)
      perform(:post, "subscriber/removeBlocks", data)
    end
  end
end
