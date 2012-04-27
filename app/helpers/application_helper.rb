module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "sortable current #{sort_direction}" : 'sortable' 
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  	link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end
end
