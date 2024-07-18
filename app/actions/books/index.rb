# frozen_string_literal: true

module Bookis
  module Actions
    module Books
      class Index < Bookis::Action
        include Deps["repos.book_repo"]
        def handle(request, response)

          books = book_repo.all_by_title(
            page:     request.params[:page]     || 1,
            per_page: request.params[:per_page] || 5
          )

          response.format = :json
          response.body   = books.map(&:to_h).to_json

        end
      end
    end
  end
end
