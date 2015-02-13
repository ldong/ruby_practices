puts /abc/xi =~ 'abc'

# Order wont matter
puts 'abc' =~ /abc/xi

puts  /a # comments
       b # comments
       c/xi =~ 'aBC'

m = /abc/i.match 'aBc'
m[0]  #=> value of the match

m = /<(.+)>(.*)<\/(.+)>/i
m = /<(?<startTag>.+)>(?<content>.+)<\/(?<endTag>.+)>/i
puts m.names
puts m.named_captures

matchdata = m.match "<html><header></header></html>"
matchdata = m.match "<html>value</html>"
p matchdata
puts matchdata
puts matchdata[0]
puts matchdata[1]
puts matchdata[2]
puts matchdata[3]


regex1 = /garf/i
regex2 = %r(<(.*)>(.*)<\/(.*)>)im

print "Type Something and I will guess: "
case gets.chomp
when regex1
  p "Is it garfield?"
when regex2
  p "It looks like HTML Tag"
else
  p "Good one, I have no idea"
end
