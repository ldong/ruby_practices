require_relative 'blog'
require_relative 'tweetable'

post = Blog::Post.new author: 'Lin Dong',
                      title: 'My Title',
                      body: 'Hi'
post.extend Tweetable

post.insert_comment Blog::Comment.new user: 'User1', body: "user1 body!"
post.insert_comment Blog::Comment.new user: nil, body: "user2 body!"

post.print
#begin
#  post.tweet
#rescue Tweetable::NoBodyError
#  puts 'Tweetable::NoBodyError'
#ensure
#  puts 'ensure run'
#end
