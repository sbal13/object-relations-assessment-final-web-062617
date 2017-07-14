class Movie


	include ActiveMini::BasicInstanceMethods
	include ActiveMini::AnalysisInstanceMethods
	extend ActiveMini::BasicClassMethods
	extend ActiveMini::AnalysisClassMethods

	attr_accessor :title

	# def initialize(title)
	# 	self.title = title
	# end

	# def ratings
	# 	Rating.all.select{|rating| rating.movie == self}
	# end

	def viewers
		ratings.map{|rating| rating.viewer}
	end

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

	# def self.sort_by_rating
	# 	self.all.sort_by{|movie| movie.average_rating}
	# end

	# def self.highest_rated
	# 	self.sort_by_rating.last
	# end

	# def self.lowest_rated
	# 	self.sort_by_rating.first
	# end

	# def self.all
	# 	@@all
	# end

	def self.find_by_title(target_title)
		self.find_by(title: target_title)
	end

end
