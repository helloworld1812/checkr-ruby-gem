module CheckrWebService
  class Client
    module Reports
      def report(id, options={})
        get "reports/#{id}", options
      end

      def update_report(id, data, options={})
        put "reports/#{id}", data, options
      end

      def create_report(data, options={})
        post "reports", data, options
      end

      def complete_report(id, options={})
        post "reports/#{id}/complete", options
      end
    end
  end
end
  