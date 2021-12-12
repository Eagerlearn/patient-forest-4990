# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

require 'rails_helper'

describe 'movies show page' do
  before do
    @studio_1 = Studio.create!(name: 'Netflix', location: 'Los Gatos')
    @studio_2 = Studio.create!(name: 'Universal', location: 'Hollywood')
    @movie_1  = @studio_1.movies.create!(title: 'The Old Guard', creation_year: 2020, genre: 'Action/Fantasy')
    @movie_2  = @studio_2.movies.create!(title: 'Nobody', creation_year: 2021, genre: 'Action/Thriller')
    @movie_3  = @studio_1.movies.create!(title: 'The Harder They Fall', creation_year: 2021, genre: 'Western/Action')
    @movie_4  = @studio_2.movies.create!(title: 'F9', creation_year: 2021, genre: 'Action/Adventure')

  end
  describe 'when I visit the movie show page' do
    it 'I see the movies title, creation_year and genre' do

      visit "/movies/#{@movie_1.id}"
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
      visit "/movies/#{@movie_2.id}"
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_2.creation_year)
      expect(page).to have_content(@movie_2.genre)
    end

    it 'has a list of all its actor from youngest to oldest' do
      actor_1 = @movie_1.actors.create!(name: 'Charlize Theron', age: 46)
      actor_2 = @movie_2.actors.create!(name: 'Bob Odenkirk', age: 59)
      actor_3 = @movie_3.actors.create!(name: 'Regina King', age: 50)
      actor_4 = @movie_4.actors.create!(name: 'Michelle Rodriguez', age: 43)
      actor_5 = @movie_3.actors.create!(name: 'Idris Elba', age: 49)

    end
  end
end