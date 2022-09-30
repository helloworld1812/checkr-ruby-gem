module CheckrWebService
  class Client
    module Ssns
      def encrypted_ssn(candidate_id, options={})
        paginate "candidates/#{candidate_id}/ssn", options
      end
    end
  end
end
 