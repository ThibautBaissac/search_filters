class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.search(params[:release]) if params[:release].present?
    @movies = @movies.search(params[:genre]) if params[:genre].present?
    @movies = @movies.where("price >= :price_from AND price <= :price_to",
      {
        price_from: params[:price_range][0],
        price_to: params[:price_range][1]
      }) if params[:price_range].present?

    @releases = Movie.distinct.pluck(:release)
    @genres = Movie.distinct.pluck(:genre)

    @price_ranges = Movie::PRICE_RANGES
  end
end
