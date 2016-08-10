# game.rb
# Responsible for managing the flow of the game
class Game

  attr_reader :current_player, :players, :questions
  # Set up a new game
  def initialize
    puts "How many players?"
    num_players = gets.chomp.to_i
    @players = []



    # the ruby way
    num_players.times do
      @players.push(Player.new)
    end

    @current_player = 0

    puts @players.length
    @questions = create_questions
    # TODO: create the list of questions and add it to the @questions array so we can pick a random question later
  end

  def switch_turn
    if @current_player == @players.length - 1
      @current_player = 0
    else
      @current_player += 1
    end
  end

  def num_players_alive
    alive_players = @players.select do |player|
      player.lives > 0
    end
    alive_players.length
  end

  def start_game_loop
    while num_players_alive >= 2
      puts "Player #{@current_player + 1}:"
      question = ask_question
      puts question.question
      puts "you have 1 ms to answer"
      correct_answer = question.answer
      player_answer = gets.chomp.to_i
      unless is_answer_correct?(correct_answer,player_answer)
        @players[current_player].take_life
      end
      show_stats
      switch_turn
    end
  end

  def show_stats
    @players.each_with_index do |player, i|
      puts "Player:#{i+1} has #{player.lives}"
    end
  end

  # def all_players_alive?
  #   # TODO: loop through @players and return
  # end

  def ask_question
    @questions.sample
  end

  def is_answer_correct?(actual_ans, player_ans)
    actual_ans == player_ans
  end

  def create_questions
    [
        Question.new("What is the next prime number after 7", 9),
        Question.new("65 – 43 = ?", 22),
        Question.new("What does the square root of 144 equal?", 12),
        Question.new("52 divided by 4 equals what?", 13),
        Question.new("87 + 56 = ?", 143),
        Question.new("7 x 9 = ?", 63),
        Question.new("What does 3 squared equal?", 9),
        Question.new("5 to the power of 0 equals what?", 1),
        Question.new("√25?", 5),
        Question.new("1318 ÷ 2?", 659),
        Question.new("What Is 24 X 2?", 48),
        Question.new("What Is 12 Squared?", 144)
    ]
  end
end
