require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @number_of_words = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @most_used_letter = @analyzed_text.most_used_letter.keys[0].upcase
    @most_used_letter_count = @analyzed_text.most_used_letter[@analyzed_text.most_used_letter.keys[0]]
    erb :results
  end
end
