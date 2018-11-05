class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @turn = Turn.new(@players)

  end

  def run_game
    while (!game_over?)
      puts '--- New Turn ---'
      puts @turn.get_status
      print '> '
      puts @turn.guess(gets.chomp.to_i)
      puts @players.map { |player| player.give_status }.join(" vs ")
      @turn.change_player
    end
    puts win_message
  end

  def game_over?
    @players.any? { |player| player.is_out? }
  end

  def get_winner
    @players.select { |player| !player.is_out? }.first
  end

  def win_message
    "\n 🎊📣🎊 #{get_winner.give_status} wins! 🎊📣🎊 \n"
  end

end
