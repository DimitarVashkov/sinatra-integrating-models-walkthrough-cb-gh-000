require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    text = TextAnalyzer.new(text_from_user)
    @words = text.count_of_words
    @vowels = text.count_of_vowels
    @cons = text.count_of_consonants
    letters = text.most_used_letter
    @freq_letter = letters.key
    @freq_letter_count = letters.value
    erb :results
  end
end
