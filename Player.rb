class Player

  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def is_out_of_lives?
    @lives == 0
  end

  def give_status
    "#{@name}: #{lives}/3"
  end

end