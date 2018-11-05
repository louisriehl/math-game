class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @turns = 1

  end

  def run_game
    puts "#{@players[0].name}: #{get_question}"
  end

  def get_question
    question = Question.new
    question_output = question.get_question_array
    "What is #{question_output[0]} + #{question_output[1]}? \n Pssst, it's #{question_output[2]}"
  end

end
