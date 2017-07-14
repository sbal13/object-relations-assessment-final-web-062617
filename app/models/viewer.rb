class Viewer
	include ActiveMini::BasicInstanceMethods
	include ActiveMini::AnalysisInstanceMethods
	extend ActiveMini::BasicClassMethods
	extend ActiveMini::AnalysisClassMethods

	attr_accessor :first_name, :last_name


	# def initialize(name)
	#   split_name = name.split(" ")
	# 	@first_name = split_name[0]
	#   @last_name = split_name[1]
	# end

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	# def save
 #    	@@all << self
 #    	self
 #    end

   	def create_rating(score, movie)
   		Rating.create(score: score, movie: movie, viewer: self)
   	end

   	# def ratings
   	# 	Rating.all.select{|rating| rating.viewer = self}
   	# end

   


  	# def average_rating
  	# 	ratings.reduce(:+)/(ratings.length)
  	# end

	# def ratings_sorted_by_score
	# 	ratings.sort_by{|rating| rating.score}
	# end

	# def highest_rating
	# 	ratings_sorted_by_score.last
	# end

	# def lowest_rating
	# 	ratings_sorted_by_score.first
	# end

	def favorite_movie
		highest_rating.movie
	end

	def movies
		ratings.map{|rating| rating.movie}
	end


    # def self.all
    # 	@@all
    # end

    # def self.create(name)
    # 	self.new(name).save
    # end

    def self.find_by_name(target_name)
    	self.find_by(name: target_name)
    end

    # def self.sort_by_num_ratings
    # 	self.all.sort_by{|viewer| viewer.ratings.length}
    # end

    # def self.most_active
    # 	self.sort_by_num_ratings.last
    # end

    # def self.least_active
    # 	self.sort_by_num_ratings.first
    # end



end
