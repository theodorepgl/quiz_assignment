# Create an interactive quiz game in Ruby that allows users to play quizzes on various topics. 
# The game should provide multiple-choice questions, keep score, and display results at the end of each quiz.

# Optional Enhancements:
# Include a timer for each question to add an element of time pressure.
# Create a leaderboard to track high scores.
# Add a feature to let users create their own custom quizzes.
# Use external data sources (e.g., CSV files) to load quiz questions dynamically.

# Quiz Data: Prepare a set of quiz questions on different topics. 
# You can use Ruby data structures like arrays or hashes to store quiz questions and their multiple-choice options, along with the correct answers.

# storage of question and answers
quiz_qustions = {
	"Q1. 5 + 5 = [ ]" => {
		"1." => "7",
		"2." => "8",
		"3." => "9",
		"4." => "10",
		"answer" => "4"
	},
	"Q2. 10 + 10 = [ ]" => {
		"1." => "17",
		"2." => "18",
		"3." => "19",
		"4." => "20",
		"answer" => "4"
	},
	#can add more question
}
# display MCQ QUESTION
def display_question(question, options)
	puts "Please select the correct asnwer."
	puts question 
	options.each do |key, value|
		puts "#{key} #{value}"
	end
end

# check answer
def check_answer(user_answer, correct_answer)
	user_answer == correct_answer
end

# run quiz game
def run_quiz(quiz_qustions)
	score = 0

	quiz_qustions.each do |question, options|
		display_question(question, options)
		print "Your input asnwer: "
		user_answer = gets.chomp

		if check_answer(user_answer, options["answer"])
			puts "Correct!"
			score += 1
		else
			puts "Incorrect!"
		end
	end

	puts "Quiz Finished! You scored #{score}"
end

run_quiz(quiz_qustions)