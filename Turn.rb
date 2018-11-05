class Turn

  attr_reader :current_player

  def initialize (players)
    @players = players.shuffle
    @current_player = @players.first
    @question = nil
  end

  def guess(attempt)
    if @question.is_correct?(attempt)
      'Yes! Good job!'
    else
      @current_player.lose_life
      'Wrong, wrong, wrong!'
    end
  end

  def change_player
    # Need to add .first to have it return a class object and not an array
    @current_player = @players.select { |player| player != @current_player }.first
  end

  def get_status
    "#{@current_player.name}: #{get_question}"
  end

  def get_question
    @question = Question.new
    "What is #{@question.integers[0]} + #{@question.integers[1]}?"
  end

end