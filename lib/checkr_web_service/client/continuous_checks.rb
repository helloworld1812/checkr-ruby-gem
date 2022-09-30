module CheckrWebService
  class Client
    module ContinuousChecks
      def continuous_checks(candidate_id, options={})
        paginate "candidates/#{candidate_id}/continuous_checks", options
      end

      def continuous_check(candidate_id, continuous_check_id, options={})
        get "continuous_checks/#{id}", options
      end

      def create_continuous_check(candidate_id, data, options={})
        post "candidates/#{candidate_id}/continuous_checks", data, options
      end

      def update_continuous_check(candidate_id, continuous_check_id, data, options={})
        put "continuous_checks/#{id}", data, options
      end

      def delete_continuous_check(candidate_id, continuous_check_id,options={})
        delete "continuous_checks/#{id}", options
      end
    end
  end
end
 