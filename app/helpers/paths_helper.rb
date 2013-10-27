module PathsHelper
  def path_selections
    paths_by_alpha.map{|p|[p.name,p.id]}
  end
  def paths_by_alpha
    Path.all(order: :name)
  end
end
