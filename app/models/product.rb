class Product < ActiveRecord::Base
  include PgSearch

  pg_search_scope(
    :search,
    against: %i(
      description
      manufacturer_name
      name
    ),
    using: {
      tsearch: {
        dictionary: "english",
        tsvector_column: "tsv"
      }
    }
  )
end