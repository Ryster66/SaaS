module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
	def sortable(column, title = nil)
		title ||= column.titleize
		hilite = column == sort_column ? "current"
		link_to title, :sort => column
	end	
end
