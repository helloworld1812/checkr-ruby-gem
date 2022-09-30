module CheckrWebService
  class Client
    module Assessments
      def assessments(options={})
        paginate "assessments", options
      end
    end
  end
end
  