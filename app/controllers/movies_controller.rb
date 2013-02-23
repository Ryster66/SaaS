class MoviesController < ApplicationController

  	helper_method :is_sorted
	def show
  	  id = params[:id] # retrieve movie ID from URI route
  	  @movie = Movie.find(id) # look up movie by unique ID
  	  # will  app/views/movies/show.<extension> by default
		
  	end

  	def index
		if("title" == is_sorted)
			@background1 = "hilite"
		end
		if("release_date" == is_sorted)
			@background2 = "hilite"
		end
		@all_ratings = Movie.ratings
		@checked = true;
		newRatings = Hash.new()
		if(params["ratings"] == nil)
			@all_ratings.map do |rate|
				newRatings.store(rate, 1)
			end
			params["ratings"] = newRatings			
		end		
		if(session["ratings"] != params["ratings"])
			session["ratings"] = params["ratings"]
		end		
		@movies = Movie.order(is_sorted).find_all_by_rating(session["ratings"].keys || params["ratings"].keys || @all_ratings)
		
  	end

	def new
    # default: render 'new' template
	end

	def create
		@movie = Movie.create!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end

  	def edit
	  	@movie = Movie.find params[:id]
		Movie.find(:all, :order => 'title')
	end

  	def update
    	@movie = Movie.find params[:id]
    	@movie.update_attributes!(params[:movie])
    	flash[:notice] = "#{@movie.title} was successfully updated."
   		redirect_to movie_path(@movie)
  	end

  	def destroy
  		@movie = Movie.find(params[:id])
  		@movie.destroy
  		flash[:notice] = "Movie '#{@movie.title}' deleted."
    	redirect_to movies_path
  	end	
		
	def is_sorted
		params[:sort] || session[:sort] || "title"		
	end
end
