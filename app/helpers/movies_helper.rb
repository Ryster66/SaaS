module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
	def sortable(column, title)
		hilite = column == sort_column ? "current"
		link_to title, :sort => column
	end	
end
