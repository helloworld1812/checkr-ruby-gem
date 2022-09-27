module CheckrWebService
  class Client
    module Reports
      def report(id, options={})
        get "reports/#{id}", options
      end
    end
  end
end
  