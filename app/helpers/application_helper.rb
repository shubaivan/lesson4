module ApplicationHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    klass = column == sort_column ? 'current' + ' ' + sort_direction.to_s : nil
    link_to title.to_s, { column: column, direction: direction }, class: klass.to_s, remote: true
  end
end
