module CheckrWebService
  class Client
    module Verifications
      def verifications(report_id, options={})
        get "reports/#{report_id}/verifications", options
      end

      def verification(verification_id, options={})
        get "verifications/#{verification_id}", options
      end
    end
  end
end
 