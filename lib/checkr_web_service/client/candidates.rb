module CheckrWebService
    class Client
      module Candidates
        def candidates(options={})
          paginate "candidates", options
        end

        def candidate(id, options={})
          get "candidates/#{id}", options
        end

        def update_candidate(id, data, options={})
          put "candidates/#{id}", data, options
        end

        def create_candidate(data, options={})
          post "candidates", data, options
        end

        def delete_candidate(id, options={})
          delete "candidates/#{id}", options
        end
      end
    end
  end
  