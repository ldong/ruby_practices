# Blocks
def form_with_proc p
  puts '<form>'
  p.call true
  puts '</form>'
end

def form &block
  puts '<form>'
  yield if block_given?
  puts '</form>'
end

def paragraph text
  puts '<p>' + text + '</p>'
end

def quote text
  puts '<quote>' + text + '</quote>'
end

# myProc = proc do
myProc = Proc.new do |only_quotes|
  p only_quotes
  paragraph 'paragraph' unless only_quotes
  quote 'quotes'
end

form_with_proc myProc


def run_block block
  print 'Running a '
  block.call
  puts "... done\n"
end

puts '========='

def app
  run_block proc { print 'proc'; return }
  run_block lambda { print 'labmda'; return }
end

app

fruit = -> (str) { ['banana', 'apple', 'grape'].include? str}
vegetable = -> (str) { ['potato', 'carrot', 'turnip'].include? str}
meat = -> (str) { ['veel', 'pork', 'chicken'].include? str}

['potato', 'apple', 'chicken', 'mackarel'].each do |food|
  case food
  when fruit
    puts food +' is a fruit'
  when vegetable
    puts food +' is a veggie'
  when meat
    puts food +' is a meat'
  else
    puts 'I dont know what it ' + food + ' is'
  end
end
