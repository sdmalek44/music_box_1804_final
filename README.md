User Stories
We are going to add Genres to our Music Box application, and song Ratings. Genres will be similar to the "Categories" we started building. You will not change any of the category work we previously did, the genre code will be 100% new code.

A genre requires a name attribute, which is a string.

A song rating is an integer value, stored in the songs table, from 1 to 5 and should default to 0. It is not a 'required' field, so previous tests should not break.

You are expected to fully test all new validations and relationships at the model level
A song can have more than one genre (example: "Open Arms" by Journey might be linked to several genres like "Classic Rock", "Ballad", etc) and a genre can be used for many different songs. Please test for this functionality in your models, too.

Here's a list of music genres you can use for testing, or you can make up your own:

Dance	Theater	Rock
Folk	Jazz	Classical
Country	Hip Hop	Techno
Opera	Funk	Disco
As a Visitor (not logged in)
User Story 1:



<!-- As a Visitor,
  When I visit a song show page,
    I see the numeric rating for this song -->

Testing requirements:
- rating should be an integer attribute (from 1 to 5)
User Story 2:
<!--
As a Visitor,
  When I visit the genre index page,
    I see all genres in the database. -->
<!--
Testing requirements:
- users should see at least 2 genres listed on the page -->
Admin User Stories
User Story 3:

As an admin user,
  When I visit the same genre index page that visitors see,
  I see the same information visitors see,
    And I also see a form to create a new genre.

Testing requirements:
- users should see at least 2 genres listed on the page
User Story 4:

As an admin user,
  When I visit the genre index page,
    And I fill out the form with a new genre's name and submit that form,
  I return to the genre index page,
    And I see all previous genres and the new genre I have just created.

Testing requirements:
- I should see at least 2 previous genres listed plus the new genre
As a Visitor (not logged in)
User Story 5:

As a Visitor,
  When I visit the genre index page,
    I cannot see the form to create new genres,
      And I do not have access to any routes that could create a genre.
    And each genre's name should be a link to that genre's show page.

Testing requirements:
- I should see at least 2 genres listed
- All users of the web site see the genres' names as links
User Story 6:

As a Visitor,
  When I visit a genre show page,
    I see all songs associated with that genre listed on the page.

Testing requirements:
- I should see at least 2 songs listed for a genre
- Also include 1 or more songs that are NOT associated with this genre and ensure
  they do not appear on the page
User Story 7:

As a Visitor,
  When I visit a song show page,
    I see genre names under a heading that says "Genres for this Song:"
      and the genres listed are only the genres associated with this song.

Testing requirements:
- I should see at least 2 genres listed for a song
- Also include 1 or more genres that are NOT associated with this song and ensure
  they do not appear on the page
User Story 8:

As a Visitor,
  When I visit a genre show page,
    I see the average rating for all songs in this genre

Testing requirements:
- I should add at least 2 songs for this genre
- Also include 1 or more songs NOT associated with this genre to ensure these
  other songs are not included in the average rating
Extensions
If you have finished ALL previous stories fully but your assessment time is not yet over, please continue on these extra stories; there are no extra points for completing these, it's to avoid disruption in the class while others are still working.

As a Visitor,
  When I visit a genre show page,
    I see the name and rating of the song with the highest rating of all songs
    in this genre
As a Visitor,
  When I visit a genre show page,
    I see the name and rating of the song with the lowest rating of all songs
    in this genre
As a Visitor,
  When I visit a song show page,
    I see up to three other songs that have the same rating.
