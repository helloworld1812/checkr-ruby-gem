module CheckrWebService
  class Client
    module Counties
      def counties(options={})
        paginate "counties", options
      end
    end
  end
end
