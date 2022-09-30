module CheckrWebService
  class Client
    module Screenings
      module EmploymentVerifications
        def employment_verification(id, options={})
          get "employment_verifications/#{id}", options
        end
      end
    end
  end
end
