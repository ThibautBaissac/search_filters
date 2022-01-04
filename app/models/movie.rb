class Movie < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:release, :price, :genre], using: {tsearch: {prefix: true}}

  PRICE_RANGES = [[0, 5], [5, 5], [15, 25], [25, 100000]]
end
