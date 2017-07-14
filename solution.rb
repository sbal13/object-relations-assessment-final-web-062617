# Please copy/paste all three classes into this file to submit your solution!


class Rating

	@@all = []

	# include ActiveMini::BasicInstanceMethods
	# extend ActiveMini::BasicClassMethods

    attr_accessor :score, :movie, :viewer

 

    def initialize(args)
    	args.each{|key, value| self.send("#{key}=", value)}
    end

    def save
    	@@all << self
    	self
    end

  
end


class Viewer
	# include ActiveMini::BasicInstanceMethods
	# include ActiveMini::AnalysisInstanceMethods
	# extend ActiveMini::BasicClassMethods
	# extend ActiveMini::AnalysisClassMethods

	@@all = []

	attr_accessor :first_name, :last_name


	def initialize(name)
	  split_name = name.split(" ")
		@first_name = split_name[0]
	  @last_name = split_name[1]
	end

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def save
    	@@all << self
    	self
    end

   	def create_rating(score, movie)
   		Rating.create(score: score, movie: movie, viewer: self)
   	end

   	def ratings
   		Rating.all.select{|rating| rating.viewer == self}
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

	def favorite_movie
		highest_rating.movie
	end

	def movies
		ratings.map{|rating| rating.movie}
	end


    def self.all
    	@@all
    end

    def self.create(name)
    	self.new(name).save
    end

    def self.find_by_name(target_name)
    	self.all.find{|viewer| viewer.name == target_name}
    end

    def self.sort_by_num_ratings
    	self.all.sort_by{|viewer| viewer.ratings.length}
    end

    def self.most_active
    	self.sort_by_num_ratings.last
    end

    def self.least_active
    	self.sort_by_num_ratings.first
    end



end



class Movie

	@@all =[]


	# include ActiveMini::BasicInstanceMethods
	# include ActiveMini::AnalysisInstanceMethods
	# extend ActiveMini::BasicClassMethods
	# extend ActiveMini::AnalysisClassMethods

	attr_accessor :title

	def initialize(title)
		self.title = title
	end

	def ratings
		Rating.all.select{|rating| rating.movie == self}
	end

	def viewers
		ratings.map{|rating| rating.viewer}
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

	def self.sort_by_rating
		self.all.sort_by{|movie| movie.average_rating}
	end

	def self.highest_rated
		self.sort_by_rating.last
	end

	def self.lowest_rated
		self.sort_by_rating.first
	end

	def self.all
		@@all
	end

	def self.find_by_title(target_title)
		self.all.find{|movie| movie.title == target_title)
	end

end




## Tried to make a module, but had trouble inheriting

# module ActiveMini


# 	module BasicInstanceMethods

# 	    def initialize(args)
# 	    	args.each{|key, value| self.send("#{key}=", value)}
# 	    end

# 		def save
# 	    	@@all << self
# 	    	self
#     	end

# 	end

# 	module BasicClassMethods
# 		def all
#     		@@all
#    	end

# 	    def create(args)
# 	    	self.new(args).save
# 	    end

# 	    def find_by(arg)
# 	    	self.all.find{|instance| instance[arg.keys[0]] == arg.values[0]}
# 	    end

# 	end

# 	module AnalysisInstanceMethods

# 		def ratings
#    			Rating.all.select{|rating| rating.send("#{self.class.to_s.downcase}" == self)}
#    		end

# 		def average_rating
# 	   		ratings.reduce(:+)/(ratings.length)
# 	   	end

# 		def ratings_sorted_by_score
# 			ratings.sort_by{|rating| rating.score}
# 		end

# 		def highest_rating
# 			ratings_sorted_by_score.last
# 		end

# 		def lowest_rating
# 			ratings_sorted_by_score.first
# 		end

# 	end

# 	module AnalysisClassMethods
# 		def sort_by_rating
# 			self.all.sort_by{|instance| instance.average_rating}
# 		end

# 		def highest_rated
# 			self.sort_by_rating.last
# 		end

# 		def lowest_rated
# 			self.sort_by_rating.first
# 		end
# 	end

# end
