# question.rb
class Question
  attr_reader :question  # :question comes from @question. this line says you can read question outside the object
  attr_reader :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

