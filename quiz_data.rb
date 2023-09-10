require 'colorize'
# add class
class QuizGame
  def initialize(categories)
    @categories = categories
    @score = 0
    @leaderboard = {}
  end

  def run_quiz # method to run the whole quiz
    @categories.each do |category, questions|
      puts "Category: #{category}".light_yellow
      puts "-·-·-·-·-·-·-·-·-·-·-".light_red
      questions.each do |question|
        user_answer = ask_question(question)
        check_answer(question, user_answer)
      end
      puts "-·-·-·-·-·-·-·-·-·-·-".light_red
    end
    display_score
    update_leaderboard
    display_leaderboard
  end

  private

  def ask_question(question) # display of the questions
    puts question[:question].light_blue
    question[:options].each_with_index do |option, index|
      puts "#{index + 1}. #{option}".light_cyan
    end
    print "Enter your answer (1-#{question[:options].length}): "
    gets.chomp.to_i
  end

  def check_answer(question, user_answer) # check for the answers
    if question[:options][user_answer - 1] == question[:answer]
      puts "Correct!".green
      @score += 1
    else
      puts "Incorrect. The answer was #{question[:answer]}.".red
    end
  end

  def display_score 
    puts "Quiz completed! You scored #{@score}/#{@categories_sum} points."
  end

  def update_leaderboard
    print "Enter your name: "
    player = gets.chomp
    @leaderboard[player] = @score
  end

  def display_leaderboard
    sorted_scores = @leaderboard.sort_by { |_, score| -score }
    puts "Leaderboard:"
    sorted_scores.each_with_index do |(player, score), index|
      puts "#{index + 1}. #{player}: #{score}"
    end
  end
end

# Example usage:
categories = {
  "Random 1" => [
    {
      question: "What is the capital of Japan?",
      options: ["Tokyo", "Kyoto", "Osaka", "Seoul"],
      answer: "Tokyo"
    },
    {
      question: "What is the largest planet in our solar system?",
      options: ["Earth", "Venus", "Mars", "Jupiter"],
      answer: "Jupiter"
    },
    {
      question: "What is the chemical formula for water?",
      options: ["CO2", "H2O", "O2", "H2O2"],
      answer: "H20"
    }
  ],
  "Random 2" => [
    {
      question: "What is the capital of South Africa?",
      options: ["Cape Town", "Pretoria", "Johannesburg", "Durban"],
      answer: "Pretoria"
    },
    {
      question: "In which sport would you perform a slam dunk?",
      options: ["Tennis", "Golf", "Basketball", "Soccer"],
      answer: "Basketball"
    },
    {
      question: "What is the world's largest mammal?",
      options: ["Elephant", "Blue whale", "Giraffe", "Rhinoceros"],
      answer: "Blue whale"
    }
  ],
  "Random 3" => [
    {
      question: "Which fruit is known as the king of fruits and has a strong odor?",
      options: ["Banana", "Pineapple", "Durian", "Mango"],
      answer: "Durian"
    },
    {
      question: "Which country is known as the Land of the Rising Sun?",
      options: ["China", "Japan", "India", "South Korea"],
      answer: "Japan"
    },
    {
      question: "What is the official language of Brazil?",
      options: ["Portuguese", "Spanish", "English", "French"],
      answer: "Portuguese"
    }
  ]
}

game = QuizGame.new(categories)
game.run_quiz