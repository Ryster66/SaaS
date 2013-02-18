module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

	def sortable(column, name = nil)
		name ||= column.titleize
		if(column == is_sorted && column == "Movie Name")
			@background1 = "hilite"
		end
		if(column == is_sorted && column == "Release Date")
			@background2 = "hilite"
		end
		link_to name, {:sort => column}
	end	
end
