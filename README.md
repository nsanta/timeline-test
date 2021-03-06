## Ruby on Rails Take Home Interview

The objective of this take home interview project is to develop a Twitter like application. 
Feel free to use any libraries, tools, or techniques that you normally would to build a rails application. 
We want to see how you work in your own environment.

Please make sure to clone this repo. When you are finished please provide a link to the repo so we can take a look.

To get started you'll need to run `bin/setup`. You can see in the `db/seeds.rb` file that two users are created: an
admin and a regular user. This app also comes with `devise` already added for authentication. 

Next are the requirements. It will be helpful to read all the requirements before beginning.

Good luck!

Requirements:


1. Create a Tweet model that has create, read, update and delete (CRUD) functionality. You should have an page to show
a list of all Tweets that have been created. The Tweet only needs to be in text. 

2. Update the Tweet index page so that the results are paginated and ordered in chronological order.

3. Update the pages related to Tweets to only allow the Author to make 
changes to their own Tweets. Any user can view the the list of Tweets.

4. We need to make sure Administrators can manage any Tweets. Update the pages related to Tweets to 
allow the Admin of a Tweet to make changes to any Tweets.

5. Users like to respond to Tweets with Replies of their own. Create a way for users to Reply to Tweets. 
The Replies only should allow for a simple text message. You don't need to worry about
making a way for users to reply to other replies. Just a simple text Reply to a Tweet.

6. Update the Tweet show page so it shows all of its replies in chronological order.

7. Create a way for users to reply to a Tweet with an Image. You don't need to worry about allowing a user to include
a comment to the image. You also don't need to worry about making a way for users to reply to images either.
