module CheckrWebService
  class Client
    module CandidateStories
      def candidate_story(id, options={})
        get "candidate_stories/#{id}", options
      end

      def delete_candidate_story(id, options={})
        delete "candidate_stories/#{id}", options
      end

      def create_candidate_story(report_id, data, options={})
        post "reports/{report_id}/candidate_stories", data, options
      end
    end
  end
end
 