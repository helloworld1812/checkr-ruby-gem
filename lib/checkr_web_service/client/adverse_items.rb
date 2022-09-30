module CheckrWebService
  class Client
    module AdverseItems
      def adverse_items(report_id, options={})
        get "reports/#{report_id}/adverse_items", options
      end
    end
  end
end
 