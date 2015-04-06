module FreshmailApi
  module SubscribersList

    def create_subscribers_list(data)
      perform(:post, "subscribers_list/create", data)
    end

    def update_subscribers_list(data)
      perform(:post, "subscribers_list/update", data)
    end

    def delete_subscribers_list(data)
      perform(:post, "subscribers_list/delete", data)
    end

    def get_subscribers_lists
      perform(:get, "subscribers_list/lists")
    end

    def add_field_to_subscribers_list(data)
      perform(:post, "subscribers_list/addField", data)
    end

    def get_subscribers_list_fields(data)
      perform(:post, "subscribers_list/getFields", data)
    end
  end
end
