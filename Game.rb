class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @question = nil
    @current_player = nil

  end

  def run_game
    @current_player = @players.shuffle.first
    while (!game_over?)
      puts '--- New Turn ---'
      puts "#{@current_player.name}: #{get_question}"
      print '> '
      player_input = gets.chomp.to_i
      puts attempt_response(player_input)
      puts @players.map { |player| player.give_status }.join(" vs ")
      self.change_player
    end

    winner = get_winner
    puts "#{winner.give_status} wins!"
  end

  def attempt_response(attempt)
    if @question.is_correct?(attempt)
      'Yes! Good job!'
    else
      @current_player.lose_life
      'Wrong, wrong, wrong!'
    end
  end

  def get_question
    @question = Question.new
    "What is #{@question.integers[0]} + #{@question.integers[1]}? \n Pssst, it's #{@question.answer}"
  end

  def change_player

    # Need to add .first to have it return a class object and not an array
    @current_player = @players.select { |player| player != @current_player }.first
  end

  def game_over?
    @players.any? { |player| player.is_out? }
  end

  def get_winner
    @players.select { |player| !player.is_out? }.first
  end

end
