# frozen_string_literal: true

module Bookis
  module Relations
    class Books < Bookis::DB::Relation
      schema :books, infer: true
      use :pagination
      per_page 5
    end
  end
end
