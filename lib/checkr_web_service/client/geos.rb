module CheckrWebService
  class Client
    module Geos
      def geos(options={})
        paginate "geos", options
      end

      def geo(id, options={})
        get "geos/#{id}", options
      end

      def create_geo(data, options={})
        post "geos", data, options
      end

      def delete_geo(id, options={})
        delete "geos/#{id}", options
      end
    end
  end
end
  