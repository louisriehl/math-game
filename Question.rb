class Question

  MAXIMUM_INTEGER = 20

  def initialize
    @random_int = Random.new
  end

  def get_random_numbers
    [@random_int.rand(MAXIMUM_INTEGER), @random_int.rand(MAXIMUM_INTEGER)]
  end

  def get_correct_answer(array)
    array[0] + array[1]
  end

  def get_question_array
    question_array = self.get_random_numbers
    question_array << self.get_correct_answer(question_array)
  end

end