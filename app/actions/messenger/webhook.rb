module Bookis
  module Actions
    module Messenger
      class Webhook < Bookis::Action
        def handle(request, response)
          response.status = 200
        end
      end
    end
  end
end
