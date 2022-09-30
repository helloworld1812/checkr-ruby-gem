module CheckrWebService
  class Client
    module Screenings
      module ProfessionalLicenseVerifications
        def professional_license_verification(id, options={})
          get "professional_license_verifications/#{id}", options
        end
      end
    end
  end
end
