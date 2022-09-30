module CheckrWebService
  class Client
    module Employers
      def employers(candidate_id, options={})
        paginate "candidates/#{candidate_id}/employers", options
      end

      def employer(candidate_id, employer_id, options={})
        get "candidates/#{candidate_id}/employers/#{employer_id}", options
      end

      def create_employer(candidate_id, data, options={})
        post "candidates/#{candidate_id}/employers", data, options
      end

      def delete_employer(candidate_id, employer_id, options={})
        delete "candidates/#{candidate_id}/employers/#{employer_id}", options
      end
    end
  end
end
 