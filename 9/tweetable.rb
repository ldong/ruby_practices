module Tweetable
  class NoBodyError < StandardError
  end

  def tweet
    raise NoBodyError if @body.nil?
    puts "Print out the body element #{@body}"
  end
end
