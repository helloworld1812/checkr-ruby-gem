module CheckrWebService
  class Client
    module ProfessionalLicenses
      def professional_licenses(candidate_id, options={})
        paginate "candidates/#{candidate_id}/professional_licenses", options
      end

      def delete_professional_license(candidate_id, options={})
        delete "candidates/#{candidate_id}/professional_licenses}", options
      end
    end
  end
end
 