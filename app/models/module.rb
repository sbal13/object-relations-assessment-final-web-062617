module ActiveMini


	module BasicInstanceMethods

	    def initialize(args)
	    	args.each{|key, value| self.send("#{key}=", value)}
	    end

		def save
	    	@@all << self
	    	self
    	end

	end

	module AnalysisInstanceMethods

		def ratings
   			Rating.all.select{|rating| rating.send("#{self.class.to_s.downcase}" == self)}
   		end

		def average_rating
	   		ratings.reduce(:+)/(ratings.length)
	   	end

		def ratings_sorted_by_score
			ratings.sort_by{|rating| rating.score}
		end

		def highest_rating
			ratings_sorted_by_score.last
		end

		def lowest_rating
			ratings_sorted_by_score.first
		end

	end

	module BasicClassMethods
		def all
    		@@all
   		end

	    def create(args)
	    	self.new(args).save
	    end

	    def find_by(arg)
	    	self.all.find{|instance| instance[arg.keys[0]] == arg.values[0]}
	    end

	end

	module AnalysisClassMethods
		def sort_by_rating
			self.all.sort_by{|instance| instance.average_rating}
		end

		def highest_rated
			self.sort_by_rating.last
		end

		def lowest_rated
			self.sort_by_rating.first
		end
	end

end