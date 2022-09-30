module CheckrWebService
  class Client
    module Schools
      def schools(candidate_id, options={})
        paginate "candidates/#{candidate_id}/schools", options
      end

      def school(candidate_id, school_id, options={})
        get "candidates/#{candidate_id}/schools/#{school_id}", options
      end

      def create_school(candidate_id, data, options={})
        post "candidates/#{candidate_id}/schools", data, options
      end

      def delete_school(candidate_id, school_id, options={})
        delete "candidates/#{candidate_id}/schools/#{school_id}", options
      end
    end
  end
end
 