class WordController < ApplicationController
  
  def show

  	word = Word.new('cat')

  	@definitions = word.all_defs_in_an_array

  end

end

