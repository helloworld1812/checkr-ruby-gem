module CheckrWebService
  class Client
    module Screenings
      module InternationalEducationVerifications
        def international_education_verification(id, options={})
          get "international_education_verifications/#{id}", options
        end
      end
    end
  end
end
