# frozen_string_literal: true

module Bookis
  class Routes < Hanami::Routes
    root to: "home.show"
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    get  "/home/:id",  to: "home.show"
    get  "/books",     to: "books.index"
    get  "/books/:id", to: "books.show"
    post "/books",     to: "books.create"
  end
end
