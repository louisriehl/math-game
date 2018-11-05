class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @question = nil

  end

  def run_game
    while (!game_over?)
      puts '--- New Turn ---'
      puts "#{@players[0].name}: #{get_question}"
      print '> '
      player_input = gets.chomp.to_i
      puts attempt_response(player_input)
      puts @players.map { |player| player.give_status }.join(" vs ")
    end
  end

  def attempt_response(attempt)
    @question.is_correct?(attempt) ? 'Yes! Good job!' : 'Wrong, wrong, wrong!'
  end

  def get_question
    @question = Question.new
    "What is #{@question.integers[0]} + #{@question.integers[1]}? \n Pssst, it's #{@question.answer}"
  end

  def game_over?
    @players.any? { |player| player.is_out_of_lives? }
  end

end
