module CheckrWebService
  class Client
    module Subscriptions
      def subscriptions(options={})
        paginate "subscriptions", options
      end

      def subscription(id, options={})
        get "subscriptions/#{id}", options
      end

      def create_subscription(data, options={})
        post "subscriptions", data, options
      end

      def update_subscription(id, data, options={})
        put "subscriptions/#{id}", data, options
      end

      def delete_subscription(id, options={})
        delete "subscriptions/#{id}", options
      end
    end
  end
end
 