# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new(title: "This is a title.")
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes)
  movie.save
  movie
end

# movie = can_be_created_in_a_block
# args = { title: "The Room", release_date: 2003 }
# movie = can_be_created_in_a_block(args)
#
# expect(movie.title).to eq("The Room")
# expect(movie.release_date).to eq(2003)
#
# i = Instructor.new
# i.first_name = "Raghu"
# i.last_name = "Betina"
# i.save

def can_be_created_in_a_block(args = {})
  movie = Movie.new(title: "Home Alone", release_date: 1990)
  if args.keys
    args.each do |key, value|
      # binding.pry
      movie[key] = value
    end
  end
  movie.save
  movie

  # Movie.create do |m|
  #   __
  # end
end

def can_get_the_first_item_in_the_database
  Movie.first.title
end

def can_get_the_last_item_in_the_database
  Movie.last.title
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find(1).title
end

def can_find_by_multiple_attributes
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.find_by({
    title: "Title",
    release_date: 2000,
    director: "Me"

  })

end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  # Instructor.where("last_name >= 'A' AND last_name <= 'C'")
  # users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)

  Movie.where("release_date > 2002").order(release_date: :desc)

end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"

  # user = User.find_by(name: 'David')
  # user.name = 'Dave'
  # user.save
  movie = Movie.find_by({title: "Awesome Flick"})
  movie.title = "Even Awesomer Flick"


  movie.save
  # binding.pry
  movie
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  #Person.update(15, :user_name => 'Samuel', :group => 'expert')

  Movie.create(title: "Wat?")
  movie = Movie.find_by({title: "Wat?"})
  movie.update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  # Update all billing objects with the 3 different attributes given
  # Billing.update_all( "category = 'authorized', approved = 1, author = 'David'" )
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update_all(title: "A Movie")
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  i = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  i.destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
#   Person.destroy_all("last_login < '2004-04-04'")
# Person.destroy_all(status: "inactive")
# Person.where(age: 0..18).destroy_all
  Movie.destroy_all
end
