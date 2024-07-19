module Bookis
  module Actions
    module Messenger
      class Webhook < Bookis::Action

        def handle(request, response)
          puts request.params.inspect
          puts request.params[:"hub.challenge"]
          response.status = 200
          response.body = request.params[:"hub.challenge"]
        end
      end
    end
  end
end
