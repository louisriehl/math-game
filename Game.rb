class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @question = nil

  end

  def run_game
    puts "--- New Turn ---"
    puts "#{@players[0].name}: #{get_question}"
    print "> "
    player_input = gets.chomp.to_i
    puts "#{@players[0].name}: #{@question.is_correct?(player_input)}"
    puts "#{@players[0].name}: #{@players[0].lives}/3 #{@players[1].name}: #{@players[1].lives}/3"
  end

  def get_question
    @question = Question.new
    "What is #{@question.integers[0]} + #{@question.integers[1]}? \n Pssst, it's #{@question.answer}"
  end

end
