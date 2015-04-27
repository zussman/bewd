class Car

  attr_accessor :model, :year, :running, :speed

  # attr_reader :driver
  # attr_writer  :driver

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @running = false
    @speed = 0
    @driver = 'Stig'
    end

  def start!
    @running = true
  end
  
  def turn_off!
    @running = false
    @speed = 0
  end
  
  def accelerate!(mph)
    if @running == true
      @speed = mph
    end
  end

  # Access Method (redundant here because of attr_accessor)
  def make
    @make
  end

  #Setter Method (redundant here because of attr_accessor)
  # car.make = 'Acura'
  def make=(value)
    @make = value
  end
end