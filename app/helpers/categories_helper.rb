module CategoriesHelper
  def categories_alpha_by_area(area=nil)
    Category.find_all_by_area(area, order: :name)
  end
end
