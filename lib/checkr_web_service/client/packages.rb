module CheckrWebService
  class Client
    module Packages
      def packages(options={})
        paginate "packages", options
      end

      def package(id, options={})
        get "packages/#{id}", options
      end

      def delete_package(id, options={})
        delete "packages/#{id}", options
      end
    end
  end
end
