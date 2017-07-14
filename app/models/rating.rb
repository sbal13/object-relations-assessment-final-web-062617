class Rating


	include ActiveMini::BasicInstanceMethods
	extend ActiveMini::BasicClassMethods

    attr_accessor :score, :movie, :viewer

 

    # def initialize(args)
    # 	args.each{|key, value| self.send("#{key}=", value)}
    # end

    # def save
    # 	@@all << self
    # 	self
    # end

  
end
