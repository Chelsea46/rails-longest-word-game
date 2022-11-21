require "open-uri"
class GamesController < ApplicationController

  def new
    @new = (0...8).map { (65 + rand(26)).chr }.join
  end

  def score

    check = params[:question]
    url = "https://wagon-dictionary.herokuapp.com/#{check}"
    parse = JSON.parse(URI.open(url).read)
    english = parse["found"]

    if check.include?(@new)
      @score = "Sorry but Answer can't be built of"
    elsif check.exclude?(@new) && english == false
      @score = "Sorry but #{check} doesn't seem to be a word"
    else
      @score = "Congratulations #{check} is a valid word"
    end

  end
end
