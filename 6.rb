class Car
  attr_reader :state

  def initialize engine, tries
    @engine = engine
    @tries = tries
  end

  def start
    @state = 'running'
    p 'Car has started'
  end

  def stop
    @state = 'stopped'
    p 'Car has stopped'
  end

end

car = Car.new 'Mazada', (1..4).to_a

puts car.inspect
puts car

car.start
p "The current state is #{car.state}"
car.stop
p "The current state is #{car.state}"
