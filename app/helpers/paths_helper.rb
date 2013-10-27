module PathsHelper
  def path_selections
    Path.all(order: :name).map{|p|[p.name,p.id]}
  end
end
