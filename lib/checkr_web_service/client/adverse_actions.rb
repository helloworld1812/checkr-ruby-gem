module CheckrWebService
  class Client
    module AdverseAction
      def adverse_action(id, options={})
        get "adverse_actions/#{id}", options
      end

      def create_adverse_action(report_id, data, options={})
        post "reports/#{report_id}/adverse_actions", data, options
      end

      def delete_adverse_action(id, options={})
        delete "adverse_actions/#{id}", options
      end
    end
  end
end
 