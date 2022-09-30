module CheckrWebService
  class Client
    module Webhooks
      def webhooks(options={})
        paginate "webhooks", options
      end

      def webhook(id, options={})
        get "webhooks/#{id}", options
      end

      def create_webhook(id, data, options={})
        post "webhooks", data, options
      end

      def delete_webhook(id, options={})
        delete "webhooks/#{id}", options
      end
    end
  end
end
 