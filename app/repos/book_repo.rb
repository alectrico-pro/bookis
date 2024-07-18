# frozen_string_literal: true

module Bookis
  module Repos
    class BookRepo < Bookis::DB::Repo

      def create(attributes)
        books.changeset(:create, attributes).commit
      end

      def get(id)
        books.by_pk(id).one!
      end

      def all_by_title(page:, per_page:)
        books
          .select(:title, :author)
          .order(books[:title].asc)
          .page(page)
          .per_page(per_page)
          .to_a
      end

    end
  end
end
