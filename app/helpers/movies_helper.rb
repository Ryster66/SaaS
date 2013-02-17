module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

	def sortable(column, name = nil)
		name ||= column.titleize
		hilite = column == sort_column ? "current" : nil
		link_to name, :sort => column
	end	
end
