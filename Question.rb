class Question

  attr_reader :integers, :answer

  MAXIMUM_INTEGER = 20

  def initialize
    @random_int = Random.new
    @integers = self.get_random_numbers
    @answer = self.get_correct_answer(@integers)
  end

  def get_random_numbers
    @integers = [@random_int.rand(MAXIMUM_INTEGER), @random_int.rand(MAXIMUM_INTEGER)]
  end

  def get_correct_answer(array)
    array[0] + array[1]
  end

  def is_correct?(attempt)
    attempt === @answer
  end

end