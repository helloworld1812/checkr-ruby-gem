module CheckrWebService
  class Client
    module DriverLicenses
      def driver_licenses(candidate_id, options={})
        paginate "candidates/#{candidate_id}/driver_licenses", options
      end

      def driver_license(candidate_id, driver_license_id, options={})
        get "candidates/#{candidate_id}/driver_licenses/#{driver_license_id}", options
      end

      def create_driver_license(candidate_id, data, options={})
        post "candidates/#{candidate_id}/driver_licenses", data, options
      end

      def update_driver_license(candidate_id, driver_license_id, data, options={})
        put "candidates/#{candidate_id}/driver_licenses/#{driver_license_id}", data, options
      end

      def delete_driver_license(candidate_id, driver_license_id, options={})
        delete "candidates/#{candidate_id}/driver_licenses/#{driver_license_id}", options
      end
    end
  end
end
 