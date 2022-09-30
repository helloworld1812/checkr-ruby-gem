module CheckrWebService
  class Client
    module Programs
      def programs(options={})
        paginate "programs", options
      end

      def program(id, options={})
        get "programs/#{id}", options
      end
    end
  end
end
  