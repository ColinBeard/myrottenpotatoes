class Movie < ActiveRecord::Base
    ####  Create
    starwars = Movie.create!(:title => 'Star Wars',
      :release_date => '25/4/1977', :rating => 'PG')
    # note that numerical dates follow European format: dd/mm/yyyy
    requiem =  Movie.create!(:title => 'Requiem for a Dream',
      :release_date => 'Oct 27, 2000', :rating => 'R')
    #  Creation using separate 'save' method, used when updating existing records
    field = Movie.new(:title => 'Field of Dreams',
      :release_date => '21-Apr-89', :rating => 'PG')
    field.save!
    field.title = 'New Field of Dreams'
    ####  Read
    pg_movies = Movie.where("rating = 'PG'")
    ancient_movies = Movie.where('release_date < :cutoff and rating = :rating',
      :cutoff => 'Jan 1, 2000', :rating => 'PG')
    pg_movies_2 = Movie.find_by_rating('PG')
    Movie.find(3)  # exception if key not found; find_by_id returns nil instead
    ####  Update
    starwars.update_attributes(:description => 'The best space western EVER',
      :release_date => '25/5/1977')
    requiem.rating = 'NC-17'
    requiem.save!
    ####  Delete
    requiem.destroy
    Movie.where('title = "Requiem for a Dream"')
    ####  Find returns an enumerable
    Movie.find_all_by_rating('PG').each do |mov|
      mov.destroy
	

    # Seed the RottenPotatoes DB with some movies.
    more_movies = [
      {:title => 'Aladdin', :rating => 'G',
        :release_date => '25-Nov-1992'},
      {:title => 'When Harry Met Sally', :rating => 'R',
        :release_date => '21-Jul-1989'},
      {:title => 'The Help', :rating => 'PG-13',
        :release_date => '10-Aug-2011'},
      {:title => 'Raiders of the Lost Ark', :rating => 'PG',
        :release_date => '12-Jun-1981'}
    ]
    # NOTE: the following line temporarily allows mass assignment
    # (needed if you used attr_accessible/attr_protected in movie.rb)
    Movie.send(:attr_accessible, :title, :rating, :release_date)
    more_movies.each do |movie|
      Movie.create!(movie)
    end

    end
end
