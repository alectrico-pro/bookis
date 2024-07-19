module Bookis
  module Actions
    module Messenger
      class Webhook < Bookis::Action
        def handle(request, response)
          Hanami.logger.info "en handle de Bookis_Action"
          response.status = 200
          response.body = {:info => "En handle de Messenger::Webhook" }.to_json
        end
      end
    end
  end
end
