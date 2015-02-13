# encoding: utf-8

class Post
  attr_reader :author, :title, :body, :comments
  def initialize options
    @author   = options[:author]
    @title    = options[:title]
    @body     = options[:body]
    @comments = options[:comments] || []
  end

  def insert_comment *comments
    comments.each {|c| @comments << c}
  end
end

class Comment
  attr_reader :user, :body
  def initialize options
    @user= options[:user]
    @body= options[:body]
  end
end


post = Post.new author: 'Lin Dong',
                title: 'Learning RoR',
                body: 'Under construction'

post.insert_comment (Comment.new user: 'user1', body: 'body' ),
                    (Comment.new user: 'user2', body: 'body' ),
                    (Comment.new user: 'user3', body: 'body' ),
                    (Comment.new user: 'user4', body: 'body')

p post.inspect

def methods *list
  p list.inspect
end

methods 1,2,3,4,5

args = [6,7,8,9,10]

methods args

# splating
methods *args

methods *[1,2], 3, *[4,5]

