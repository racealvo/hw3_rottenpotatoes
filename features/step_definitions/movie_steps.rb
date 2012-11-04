# Add a declarative step here for populating the DB with movies.

# each returned element will be a hash whose key is the table header.
# you should arrange to add that movie to the database here.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # build the where clause
    can_find_this_movie = ""
    movie.each do |elem|
      can_find_this_movie += " and " + elem[0].to_s + " = " + elem[1].to_s
    end
    can_find_this_movie = can_find_this_movie[5, can_find_this_movie.length-5]
    # Find the movie in the DB.  If not there, then add it.
    if Movie.where can_find_this_movie == nil
      Movie.create!(movie)
    end
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end
