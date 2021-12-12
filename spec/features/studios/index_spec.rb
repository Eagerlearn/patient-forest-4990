# As a user,
# When I visit the studio index page
# I see a each studio's name and location
# And underneath each studio, I see the titles of all of its movies.

require 'rails_helper'

describe 'studios index page' do
  before do
    @studio_1 = Studio.create!(name: 'Netflix', location: 'Los Gatos')
    @studio_2 = Studio.create!(name: 'Universal', location: 'Hollywood')
    @movie_1  = @studio_1.movies.create!(title: 'The Old Guard', creation_year: 2020, genre: 'Action/Fantasy')
    @movie_1  = @studio_2.movies.create!(title: 'Nobody', creation_year: 2021, genre: 'Action/Thriller')
    @movie_1  = @studio_1.movies.create!(title: 'The Harder They Fall', creation_year: 2021, genre: 'Western/Action')
    @movie_1  = @studio_2.movies.create!(title: 'F9', creation_year: 2021, genre: 'Action/Adventure')

    visit '/studios'
  end
  describe 'when I visit the studio index page' do
    it 'I see each studios name and location' do

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_2.title)
    end
  end
end