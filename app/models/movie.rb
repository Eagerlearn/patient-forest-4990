class Movie < ApplicationRecord
  belongs_to :studio

def movies_by_studio
  movies = Movie.all
  @movies = movies.find(params[:id])
end
end

