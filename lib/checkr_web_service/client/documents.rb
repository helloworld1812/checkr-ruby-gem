module CheckrWebService
  class Client
    module Documents
      def documents(candidate_id, options={})
        get "candidates/#{candidate_id}/documents", options
      end

      def document(id, options={})
        get "documents/#{id}", options
      end

      def create_document(candidate_id, data, options={})
        get "candidates/#{candidate_id}/documents", options
      end
    end
  end
end
 