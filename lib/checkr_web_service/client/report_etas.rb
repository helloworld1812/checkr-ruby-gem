module CheckrWebService
  class Client
    module ReportEtas
      def report_eta(report_id, options={})
        get "reports/#{report_id}/eta", options
      end
    end
  end
end
