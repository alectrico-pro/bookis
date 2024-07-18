# frozen_string_literal: true

module Bookis
  module Actions
    module Home
      class Show < Bookis::Action
        def handle(request, response)
          response.body= "Welcome to Bookshelf"
        end
      end
    end
  end
end
