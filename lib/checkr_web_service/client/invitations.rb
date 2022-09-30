module CheckrWebService
  class Client
    module Invitations
      def invitations(options={})
        paginate "invitations", options
      end

      def invitation(id, options={})
        get "invitations/#{id}", options
      end

      def delete_invitation(id, options={})
        delete "invitations/#{id}", options
      end

      def create_invitation(data, options={})
        post "invitations", data, options
      end
    end
  end
end
 