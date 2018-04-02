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
    erb :results
  end
end
