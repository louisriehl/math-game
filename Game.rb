class Game

  def initialize

    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [ @player1, @player2 ]
    @turns = 1

  end

  def run_game

  end

end
