class Movie < ActiveRecord::Base
	def self.ratings		
		return @all_ratings = ['G','PG','PG-13','R']
	end
end
