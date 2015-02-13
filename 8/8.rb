# encoding: utf-8

require_relative 'blog'
require_relative 'tweetable'
# load the gem
# require ''

post = Blog::Post.new author: 'Lin Dong',
                      title: 'title',
                      body: 'A body'
                      # comments: Blog::Comment.new(user: 'Lin Dong',
                      #                             body: 'comment')
post.extend Tweetable
post.insert_random_comment
post.insert_random_comment
post.tweet
post.comments.each { |c| c.tweet}

p post
