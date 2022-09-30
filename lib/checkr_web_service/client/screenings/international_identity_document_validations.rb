module CheckrWebService
  class Client
    module Screenings
      module InternationalIdentityDocumentValidations
        def international_identity_document_validation(id, options={})
          get "international_identity_document_validations/#{id}", options
        end
      end
    end
  end
end
