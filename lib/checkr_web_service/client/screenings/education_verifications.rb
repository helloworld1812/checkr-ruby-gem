module CheckrWebService
  class Client
    module Screenings
      module EducationVerifications
        def education_verification(id, options={})
          get "education_verifications/#{id}", options
        end
      end
    end
  end
end
