module CheckrWebService
  class Client
    module ReportAddresses
      def report_addresses(report_id, options={})
        paginate "reports/#{report_id}/report_addresses", options
      end
    end
  end
end
