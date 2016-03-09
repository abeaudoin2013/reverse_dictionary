class Word

	# %w(rubygems wordnik).each {|lib| require lib}

	attr_accessor :name

	def initialize(name)

		self.name = name

	end



	def get_definitions

		# initialize wordnik definitions for word
		Wordnik.word.get_definitions(self.name)

	end


	def all_defs_in_an_array

		#get definitions from the get_definitions method

		definitions = self.get_definitions



		#put all definitions into one array

		all_definitions = []

		definitions.each do |definition|

			#get rid of articles, prepositions, and conjunctions
			# in order to make our search a little cleaner

			def_without_common_words = self.get_rid_of_articles_preps_and_conj(definition["text"])

			#push the cleaned-up array to all definitions

			all_definitions.push(def_without_common_words)

		end

		all_definitions

	end 


	def get_rid_of_articles_preps_and_conj(definition)

		#downcase all the words and check if they equal anything too common.
		#Return array bac

		words_in_def = definition.split(' ')	
		
		words_in_def.each do |word|

			word.downcase!

			if word == "the"

				words_in_def.delete("the")

			elsif word == "a"

				words_in_def.delete("a")

			elsif word == "an"

				words_in_def.delete("an")

			elsif word == "at"

				words_in_def.delete("at")

			elsif word == "by"

				words_in_def.delete("by")

			elsif word == "for"

				words_in_def.delete("for")

			elsif word == "in"

				words_in_def.delete("in")

			elsif word == "of"

				words_in_def.delete("of")

			elsif word == "on"

				words_in_def.delete("on")

			elsif word == "to"

				words_in_def.delete("to")

			elsif word == "up"

				words_in_def.delete("up")

			elsif word == "and"

				words_in_def.delete("and")

			elsif word == "as"

				words_in_def.delete("as")

			elsif word == "but"

				words_in_def.delete("but")

			elsif word == "or"

				words_in_def.delete("or")

			elsif word == "nor"

				words_in_def.delete("nor")

			end


		end	

	end


end
